Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 9 Nov 2016 08:44:18 +0100
From: Simon Horman <horms@verge.net.au>
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/9 v2] arm64: dts: m3ulcb: enable SDHI0
Message-ID: <20161109074418.GC30093@verge.net.au>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1478614461-9918-1-git-send-email-vladimir.barinov@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478614461-9918-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 08, 2016 at 05:14:21PM +0300, Vladimir Barinov wrote:
> This supports SDHI0 on M3ULCB board SD card slot
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Reviewed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks Vladimir,

I have queued up the following patches:

arm64: dts: h3ulcb: rename SDHI0 pins
arm64: dts: h3ulcb: enable SDHI2
arm64: dts: m3ulcb: enable SDHI2
arm64: dts: m3ulcb: enable SDHI0

For reference I would, however, like to make some comments regarding the
way you have submitted these:

1. I did not provide a Reviewed-off-by tag or any other tag as far as I
   recall. So its not appropriate for you to add one when posting patches.
   I have removed it.

2. Not withstanding the above, Reviewed-off-by is an invalid tag.
   Perhaps you mean Reviewed-by.

3. When you repost patches I have a slight preference for you to repost
   them in a fresh thread. And if the patchset has more than one patch then
   with a fresh cover letter. This makes it a little easier for me
   to see what is going on. And gives a more natural place for
   me to respond to a patchset.
