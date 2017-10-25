Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:35206 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751173AbdJYGCc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 02:02:32 -0400
Date: Wed, 25 Oct 2017 09:02:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/rcar-du: Adjust 14 checks for null pointers
Message-ID: <20171025060209.pqtyqk4weduvmzxj@mwanda>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 24, 2017 at 06:02:30PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Oct 2017 17:47:37 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written !…
> 
> Thus fix the affected source code places.
> 

This one is fine except for the commit message.

regards,
dan carpenter
