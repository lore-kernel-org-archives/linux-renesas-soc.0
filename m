Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:9248
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725939AbeKULjT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 06:39:19 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Simon <horms@verge.net.au>
CC: Magnus <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] arm64: dts: renesas: r8a7796: add SSIU support for sound
Date: Wed, 21 Nov 2018 01:07:11 +0000
Message-ID: <87y39n1c2y.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9661075D9F5AC448C305686DD4E2582@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

rsnd driver supports SSIU now, let's use it.
Then, BUSIF DMA settings on rcar_sound,ssi (=3D rxu, txu) are
no longer needed.
To avoid git merge timing issue / git bisect issue,
this patch doesn't remove it so far, but will be removed in
the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 211 +++++++++++++++++++++++++++=
++++
 1 file changed, 211 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts=
/renesas/r8a7796.dtsi
index 449eb33..5cc9b8b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1826,6 +1826,217 @@
 				};
 			};
=20
+			rcar_sound,ssiu {
+				ssiu00: ssiu-0 {
+					dmas =3D <&audma0 0x15>, <&audma1 0x16>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu01: ssiu-1 {
+					dmas =3D <&audma0 0x35>, <&audma1 0x36>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu02: ssiu-2 {
+					dmas =3D <&audma0 0x37>, <&audma1 0x38>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu03: ssiu-3 {
+					dmas =3D <&audma0 0x47>, <&audma1 0x48>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu04: ssiu-4 {
+					dmas =3D <&audma0 0x3F>, <&audma1 0x40>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu05: ssiu-5 {
+					dmas =3D <&audma0 0x43>, <&audma1 0x44>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu06: ssiu-6 {
+					dmas =3D <&audma0 0x4F>, <&audma1 0x50>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu07: ssiu-7 {
+					dmas =3D <&audma0 0x53>, <&audma1 0x54>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu10: ssiu-8 {
+					dmas =3D <&audma0 0x49>, <&audma1 0x4a>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu11: ssiu-9 {
+					dmas =3D <&audma0 0x4B>, <&audma1 0x4C>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu12: ssiu-10 {
+					dmas =3D <&audma0 0x57>, <&audma1 0x58>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu13: ssiu-11 {
+					dmas =3D <&audma0 0x59>, <&audma1 0x5A>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu14: ssiu-12 {
+					dmas =3D <&audma0 0x5F>, <&audma1 0x60>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu15: ssiu-13 {
+					dmas =3D <&audma0 0xC3>, <&audma1 0xC4>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu16: ssiu-14 {
+					dmas =3D <&audma0 0xC7>, <&audma1 0xC8>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu17: ssiu-15 {
+					dmas =3D <&audma0 0xCB>, <&audma1 0xCC>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu20: ssiu-16 {
+					dmas =3D <&audma0 0x63>, <&audma1 0x64>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu21: ssiu-17 {
+					dmas =3D <&audma0 0x67>, <&audma1 0x68>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu22: ssiu-18 {
+					dmas =3D <&audma0 0x6B>, <&audma1 0x6C>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu23: ssiu-19 {
+					dmas =3D <&audma0 0x6D>, <&audma1 0x6E>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu24: ssiu-20 {
+					dmas =3D <&audma0 0xCF>, <&audma1 0xCE>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu25: ssiu-21 {
+					dmas =3D <&audma0 0xEB>, <&audma1 0xEC>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu26: ssiu-22 {
+					dmas =3D <&audma0 0xED>, <&audma1 0xEE>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu27: ssiu-23 {
+					dmas =3D <&audma0 0xEF>, <&audma1 0xF0>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu30: ssiu-24 {
+					dmas =3D <&audma0 0x6f>, <&audma1 0x70>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu31: ssiu-25 {
+					dmas =3D <&audma0 0x21>, <&audma1 0x22>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu32: ssiu-26 {
+					dmas =3D <&audma0 0x23>, <&audma1 0x24>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu33: ssiu-27 {
+					dmas =3D <&audma0 0x25>, <&audma1 0x26>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu34: ssiu-28 {
+					dmas =3D <&audma0 0x27>, <&audma1 0x28>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu35: ssiu-29 {
+					dmas =3D <&audma0 0x29>, <&audma1 0x2A>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu36: ssiu-30 {
+					dmas =3D <&audma0 0x2B>, <&audma1 0x2C>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu37: ssiu-31 {
+					dmas =3D <&audma0 0x2D>, <&audma1 0x2E>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu40: ssiu-32 {
+					dmas =3D	<&audma0 0x71>, <&audma1 0x72>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu41: ssiu-33 {
+					dmas =3D <&audma0 0x17>, <&audma1 0x18>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu42: ssiu-34 {
+					dmas =3D <&audma0 0x19>, <&audma1 0x1A>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu43: ssiu-35 {
+					dmas =3D <&audma0 0x1B>, <&audma1 0x1C>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu44: ssiu-36 {
+					dmas =3D <&audma0 0x1D>, <&audma1 0x1E>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu45: ssiu-37 {
+					dmas =3D <&audma0 0x1F>, <&audma1 0x20>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu46: ssiu-38 {
+					dmas =3D <&audma0 0x31>, <&audma1 0x32>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu47: ssiu-39 {
+					dmas =3D <&audma0 0x33>, <&audma1 0x34>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu50: ssiu-40 {
+					dmas =3D <&audma0 0x73>, <&audma1 0x74>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu60: ssiu-41 {
+					dmas =3D <&audma0 0x75>, <&audma1 0x76>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu70: ssiu-42 {
+					dmas =3D <&audma0 0x79>, <&audma1 0x7a>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu80: ssiu-43 {
+					dmas =3D <&audma0 0x7b>, <&audma1 0x7c>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu90: ssiu-44 {
+					dmas =3D <&audma0 0x7d>, <&audma1 0x7e>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu91: ssiu-45 {
+					dmas =3D <&audma0 0x7F>, <&audma1 0x80>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu92: ssiu-46 {
+					dmas =3D <&audma0 0x81>, <&audma1 0x82>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu93: ssiu-47 {
+					dmas =3D <&audma0 0x83>, <&audma1 0x84>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu94: ssiu-48 {
+					dmas =3D <&audma0 0xA3>, <&audma1 0xA4>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu95: ssiu-49 {
+					dmas =3D <&audma0 0xA5>, <&audma1 0xA6>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu96: ssiu-50 {
+					dmas =3D <&audma0 0xA7>, <&audma1 0xA8>;
+					dma-names =3D "rx", "tx";
+				};
+				ssiu97: ssiu-51 {
+					dmas =3D <&audma0 0xA9>, <&audma1 0xAA>;
+					dma-names =3D "rx", "tx";
+				};
+			};
+
 			rcar_sound,ssi {
 				ssi0: ssi-0 {
 					interrupts =3D <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
--=20
2.7.4
