Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:54739 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751550AbcLNCPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 21:15:55 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
Subject: clk: clk-mstp has never worked for RZ/A1
Date: Wed, 14 Dec 2016 02:14:50 +0000
Message-ID: <SG2PR06MB1165A4A8A555A3176D0C4ED98A9A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello all,

Today I realized that the clock control using clk-mstp has never actually w=
orked for RZ/A1 (r7s72100).

The reason is that the MSTP registers are 8-bit instead of the normal 32-bi=
t, and if you do a 32-bit write to them, nothing happens.
If you look in drivers/clk/renesas/clk-mstp.c, you'll see that clk_readl an=
d clk_writel are used.


The reason why I have gotten this far is because u-boot has been enabling e=
verything early in boot, so all the clocks were already on.
Of course if I disable everything again before I booting the kernel....noth=
ing works.


If I change the accesses in clk-mspt.c to 8-bit, clocks get enabled/disable=
d as they should.
#define clk_readl readb
#define clk_writel writeb


So, any suggestions on the best way to fix this???
Ideally I would like something that can easily be integrated back into 4.9.=
x



Maybe add a new DT property named "reg_width":

	mstp3_clks: mstp3_clks@fcfe0420 {
		#clock-cells =3D <1>;
		compatible =3D "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
		reg =3D <0xfcfe0420 4>;
		reg_width =3D 8;
		clocks =3D <&p0_clk>;
		clock-indices =3D <R7S72100_CLK_MTU2>;
		clock-output-names =3D "mtu2";
	};

and then in cpg_mstp_clocks_init(), do:

	if (of_find_property(np, "reg_width", &i))
		group->reg_width =3D i;
	else
		group->reg_width =3D 32;	/* default */


In cpg_mstp_clock_endisable(), do:

	if (group->reg_width =3D=3D 8)
		writeb(value, group->smstpcr);
	else
		clk_writel(value, group->smstpcr);


Thoughts?


Chris
