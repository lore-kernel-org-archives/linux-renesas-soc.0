Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55869 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751022AbeEMITc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 May 2018 04:19:32 -0400
Date: Sun, 13 May 2018 10:19:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT] arm64: dts: r8a77965: add I2C support
Message-ID: <20180513081913.3o57lab2nkwz2m7x@verge.net.au>
References: <20180511140029.16419-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180511140029.16419-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 11, 2018 at 04:00:29PM +0200, Niklas Söderlund wrote:
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 99 ++++++++++++++++++++---
>  1 file changed, 90 insertions(+), 9 deletions(-)
> 
> Hi Simon,
> 
> I have only tested i2c4 and the adv7482 which is connected there. But it 
> seemed silly to post this patch without enable all i2c as they are 
> according to the datasheet are the same as on H3 and M3-W.

Thanks Niklas,

I agree this makes sense. Do we have any way to test those nodes?
If not I'm inclined to accept the patch without testing.
