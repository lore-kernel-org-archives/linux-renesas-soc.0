Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:60248 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755993AbcINMfi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 08:35:38 -0400
Received: from relmlac3.idc.renesas.com (relmlac3.idc.renesas.com [10.200.69.23])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id DE07455262
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 21:35:35 +0900 (JST)
Received: from relmlac3.idc.renesas.com (localhost [127.0.0.1])
        by relmlac3.idc.renesas.com (Postfix) with ESMTP id C9A411800A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 21:35:35 +0900 (JST)
From: Chris Brandt <Chris.Brandt@renesas.com>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: How to put an 'if' statement in a dts?
Date: Wed, 14 Sep 2016 12:35:33 +0000
Message-ID: <SG2PR06MB1165DA353BCD0325E83D207D8AF10@SG2PR06MB1165.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On the RZ/A1 RSK board, the one card slot can be used for SDHI or MMC (SDHI=
1 and MMC share the same pins).

For the r7s72100-rskrza1.dts, I would like to add in support for both SDHI1=
 and MMC for someone to use as reference. Of course they should only pick o=
ne.

So my options are:

A) Make some type of an 'if' statement in the dts that can be selected at b=
oot time

B) Leave one as 'status =3D "disabled"', and then the user just has to swit=
ch around the 'status' properties before boot (either modify the dts file o=
r change it in u-boot with the fdt command)

C) Pick one and forget about the other (because you're not allowed to have =
inactive nodes in your board dts files)


The MMC also needs a 3.3v "regulator-fixed" node, so it would be nice to pu=
t that in the 'if' statement too, but since the dts for the rskrza1 board i=
s mostly for reference, it's not a big deal if that one is just always acti=
ve.

In the current RZ/A1 BSP, I basically put everything in the board-rskrza1.c=
 file so all users had to do was delete what was not relevant to their desi=
gn (deleting code is easier than trying to figure out what to add). So, now=
 I'm trying to figure out how to do something similar with DT.

Thank you,
Chris
