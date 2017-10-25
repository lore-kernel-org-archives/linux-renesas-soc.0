Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:37743 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751630AbdJYHdT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 03:33:19 -0400
Date: Wed, 25 Oct 2017 10:32:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: drm/rcar-du: Adjust 14 checks for null pointers
Message-ID: <20171025073250.i6v6jwijbkmybmtk@mwanda>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
 <20171025060209.pqtyqk4weduvmzxj@mwanda>
 <2d491a67-184a-c03f-e6ee-da88066e97f0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d491a67-184a-c03f-e6ee-da88066e97f0@users.sourceforge.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 25, 2017 at 08:44:38AM +0200, SF Markus Elfring wrote:
> >> The script “checkpatch.pl” pointed information out like the following.
> >>
> >> Comparison to NULL could be written !…
> >>
> >> Thus fix the affected source code places.
> >>
> > 
> > This one is fine
> 
> This kind of feedback is nice.
> 
> 
> > except for the commit message.
> 
> Would you like to support Unicode characters there?
> 

Multiple people have answered this question already and I have answered
it multiple times.

regards,
dan carpenter
