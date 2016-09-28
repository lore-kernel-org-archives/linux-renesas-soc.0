Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-hk2apc01on0109.outbound.protection.outlook.com ([104.47.124.109]:51622
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750714AbcI1Gnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2016 02:43:43 -0400
From: Jithin T Raj <jithin.t@tataelxsi.co.in>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>
Subject: LVDS SUPPORT RCAR M2(R8A7791)
Date: Wed, 28 Sep 2016 06:43:38 +0000
Message-ID: <SG2PR0401MB129656CA9F79AA1CE7F384F1D8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


hi,
=A0 first of all thank u for  the patch given..I tryed with that..I am gett=
ing uImage after build..but  when i tried to make .dtb file i am getting fo=
llowing error
=A0

ubuntu@teltvm2468l:~/Jithin/Koelsch/kernel$ make -j4 r8a7791-koelsch.dtb
=A0 CC=A0=A0=A0=A0=A0 scripts/mod/devicetable-offsets.s
=A0 GEN=A0=A0=A0=A0 scripts/mod/devicetable-offsets.h
=A0 HOSTCC=A0 scripts/mod/file2alias.o
=A0 HOSTLD=A0 scripts/mod/modpost
=A0 DTC=A0=A0=A0=A0 arch/arm/boot/dts/r8a7791-koelsch.dtb
Error: arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi:41.4-5 label or path,=
 'lvds_connector', not found
FATAL ERROR: Syntax error parsing input tree
make[1]: *** [arch/arm/boot/dts/r8a7791-koelsch.dtb] Error 1
make: *** [r8a7791-koelsch.dtb] Error 2


Best Regards
Jithin T Raj





=20

=20
   =
