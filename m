Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39956 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757186AbdEKPsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2017 11:48:40 -0400
Date: Thu, 11 May 2017 17:48:31 +0200
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH/RFT 0/2] ARM: dts: gose: Enable UHS-I SDR-50 and SDR-104
Message-ID: <20170511154831.GI21895@verge.net.au>
References: <1492494939-24568-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1492494939-24568-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 18, 2017 at 02:55:37PM +0900, Simon Horman wrote:
> Enable
> - SDR-50 and SDR-104 for SDHI0 and;
> - SDR-50 for SDHI1
> 
> Verified:
> - SDR104 for SDHI0
> - SDR50 for SDHI1
> - Results comprable to those listed for other Renesas R-Car Gen2 boards on
>   http://elinux.org/Tests:SD-SDHI-SDR104
> Untested:
> SDR50 for SDHI3
> - HS C4 card present in slot on board which I access remotely

The above should read SDHI2 rather than SDHI3.
I have now been able to test SDHI2 and have queued up this series
with Wolfram's Acks.

> Simon Horman (2):
>   ARM: dts: r8a7793: set maximum frequency for SDHI clocks
>   ARM: dts: gose: Enable UHS-I SDR-50 and SDR-104
> 
>  arch/arm/boot/dts/r8a7793-gose.dts | 34 +++++++++++++++++++++++++++++++---
>  arch/arm/boot/dts/r8a7793.dtsi     |  3 +++
>  2 files changed, 34 insertions(+), 3 deletions(-)
> 
> -- 
> 2.7.0.rc3.207.g0ac5344
> 
