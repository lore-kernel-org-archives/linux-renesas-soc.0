Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:34872 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751990AbdJYGBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 02:01:31 -0400
Date: Wed, 25 Oct 2017 09:01:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rcar-du: Use common error handling code in
 rcar_du_encoders_init()
Message-ID: <20171025060104.vlk546frvmjici37@mwanda>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a subtle thing but my preference on this type of thing is the
way the original code is written.  I'm still slightly annoyed that
someone once made me rewrite a patch using the new style...  But anyways
I guess other people sometimes disagree with me.

Unwinding is for when you allocate five things in a row.  You have
to undo four if the last allocation fails.  But say you have to take a
lock part way through and drop it before the end of the function.  The
lock/unlock is not part of the list of five resources that you want the
function to take so it doesn't belong in the unwind code.

If you add the lock/unlock to the unwind code, then it makes things a
bit tricky because then you have to do funny things like:

free_four:
	free(four);
	goto free_three:  <-- little bunny hop
unlock:                   <-- less useful label
	unlock();
free_three:
	free_three();
free_two:
	free(two);
free_one:
	free(one);

	return ret;

It's better to just do the unlocking before the goto.  That way the
lock and unlock are close together.

	if (!four) {
		unlock();
		ret = -EFAIL;
		goto free_three;
	}

Of course, having a big unlock label makes sense if you take a lock at
the start of the function and need to drop it at the end.  But in this
case we are taking a  lock then dropping it, and taking the next, then
dropping it and so on.  It's a different situation.

regards,
dan carpenter
