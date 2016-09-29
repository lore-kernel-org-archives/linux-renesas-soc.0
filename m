Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34469 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932451AbcI2JZJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 05:25:09 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: LVDS SUPPORT RCAR
Date: Thu, 29 Sep 2016 12:25:06 +0300
Message-ID: <368788104.D0PM6tteiN@avalon>
In-Reply-To: <SG2PR0401MB1296333337E6035C78F570F4D8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB1296333337E6035C78F570F4D8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Jithin,

On Wednesday 28 Sep 2016 09:22:46 Jithin T Raj wrote:
> hi,
>    first of all thanks alot for the support you are giving..when i tried to
> make .dtb file i am getting following error..I am using 3.10.31-ltsi

3.10.31 is very old. If you want community support I recommend upgrading to 
the mainline kernel. If you can't, you'll have to update your device tree (and 
possibly the DU driver) by backporting changes from mainline.

> ubuntu@teltvm2468l:~/Jithin/Koelsch/kernel$ make -j4 r8a7791-koelsch.dtb
>   CC      scripts/mod/devicetable-offsets.s
>   GEN     scripts/mod/devicetable-offsets.h
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTLD  scripts/mod/modpost
>   DTC     arch/arm/boot/dts/r8a7791-koelsch.dtb
> Error: arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi:41.4-5 label or path,
> 'lvds_connector', not found FATAL ERROR: Syntax error parsing input tree
> make[1]: *** [arch/arm/boot/dts/r8a7791-koelsch.dtb] Error 1
> make: *** [r8a7791-koelsch.dtb] Error 2
> 
> here i am attaching my r8a7791.dts file

-- 
Regards,

Laurent Pinchart
