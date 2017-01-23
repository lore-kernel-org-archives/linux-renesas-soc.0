Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:6308 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751102AbdAWT6T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 14:58:19 -0500
Received: from relmlac4.idc.renesas.com (relmlac4.idc.renesas.com [10.200.69.24])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id 8C05551CD8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2017 04:58:17 +0900 (JST)
Received: from relmlac4.idc.renesas.com (localhost [127.0.0.1])
        by relmlac4.idc.renesas.com (Postfix) with ESMTP id 5DD3948014
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2017 04:58:17 +0900 (JST)
From: Chris Brandt <Chris.Brandt@renesas.com>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: [RFC] Runtime PM on the RZ/A series is never going to work right
Date: Mon, 23 Jan 2017 19:58:15 +0000
Message-ID: <SG2PR06MB116554401FE404334E924EE38A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Renesas SoC people,


One difference between R-Car/RZG vs RZA is that there is no status bits for=
 the MSTP clocks.
This means even though you enable a clock by clearing the module-stop bit, =
you're not really guaranteed that the peripheral block is ready to be used.

For the most part, the register interface is accessible, but usage of the H=
W might not be fully ready.

Now that clock enable/disable has been fixed for RZ/A1 and actually works, =
you can start to see things break.

For RZ/A1 (r7s72100) you can see this for the I2C driver (i2c-riic.c) and S=
PI driver (spi-rspi.c).
Both of these drivers disable the clock in between EVERY TRANSFER as a mean=
s of runtime pm.

Since SDHI (tmio) needs to keep the clock running for the card detect logic=
, it does not implement runtime pm, so it's OK.


The only way to really fix this for RZ/A1 is to put an arbitrary delay in t=
he clk-mstp.c driver:

	spin_lock_irqsave(&group->lock, flags);

	value =3D cpg_mstp_read(group, group->smstpcr);
	if (enable)
		value &=3D ~bitmask;
	else
		value |=3D bitmask;
	cpg_mstp_write(group, value, group->smstpcr);

	spin_unlock_irqrestore(&group->lock, flags);

+	if (enable || !group->mstpsr)
+		udelay(100);
+
	if (!enable || !group->mstpsr)
		return 0;


Or, just remove runtime PM for RZ/A1.

* i2c-riic.c: This driver is just for the RZ/A series, so just remove runti=
me pm completely
* spi-rspi.c: Disable runtime pm just for RZ/A series parts


Therefore, before I start firing off patches to remove runtime PM for RZ/A,=
 does anyone have an opinion one way of the other????


Regards,
Chris
