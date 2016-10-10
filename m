Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-sg2apc01on0136.outbound.protection.outlook.com ([104.47.125.136]:61001
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751437AbcJJJV7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2016 05:21:59 -0400
From: Jithin T Raj <jithin.t@tataelxsi.co.in>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        Karl Auer <kauer@biplane.com.au>
Subject: About Kernel codes
Date: Mon, 10 Oct 2016 09:07:35 +0000
Message-ID: <SG2PR0401MB12967580C2EFC09AB1244F1BD8DB0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi all,
=A0I am always stuck with the declaration or ports in kernel code...


&du{
-----------------
------------------ bla bla....


ports {
=A0=A0 =A0=A0=A0 =A0port@1 {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0endpoint {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0remote-endpoint =3D <&adv7123_in>;
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0};};

In my knowledge I understand that here display unit has one=A0 port(port1) =
which is for
vga encoder IC input signal..is it?and I am eager to know where these ports=
 are defined in tree(In case of Koelsche,Alt,Lager etc) and am I able to ch=
ange the port number..I mean,can I give above as port@0 instead of port@1..=
and =A0also how can I add another ports here??

Hopping for your comments




=20
Best Regards
 Jithin T Raj
=20
=20
   =
