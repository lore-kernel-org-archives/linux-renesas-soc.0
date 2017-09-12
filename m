Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from esa5.dell-outbound.iphmx.com ([68.232.153.95]:33471 "EHLO
        esa5.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751476AbdILWB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 18:01:26 -0400
From: <Prashanth.Giri@dell.com>
To: <linux-renesas-soc@vger.kernel.org>
Subject: sh: sh7758 User land programs crash with SIGBUS.
Date: Tue, 12 Sep 2017 22:00:28 +0000
Message-ID: <bac7196cecbb43159feaaf1fc1605767@AUSX13MPC101.AMER.DELL.COM>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

I am trying to port from 3.4.11 kernel to 3.10.107 based on my sh7757/58 pr=
ocessor hardware and running into some odd behavior with user land applicat=
ions. I pretty much got the kernel up and running but some of the applicati=
ons in user land won't launch and are crashing with the below messages in d=
mesg.

<5>Fixing up unaligned userspace access in "aim" pid=3D28533 pc=3D0x3b14249=
2 ins=3D0x6252
<5>Sending SIGBUS to "aim" pid=3D28533 due to unaligned access (PC 3b142492=
 PR 296167e4) ins=3D0x6252
<5>Sending SIGBUS to "pm" pid=3D28741 due to unaligned access (PC 58b2e409 =
PR 297b0118) ins=3D0x8dc1
<5>Sending SIGBUS to "pm" pid=3D28741 due to unaligned access (PC 3b142492 =
PR 296ce7e4) ins=3D0x6252

Some of the older posts in the mailing lists pointed out to I/D cache issue=
s, I tried disabling the cache altogether in a hope to root cause the issue=
, but still got the same responses. For some reason I believe the loader is=
 loading these programs into odd addresses. I am clueless as to where to lo=
ok for the possible issue. Is there any obvious settings that I am missing =
from the board/cpu setup ?=20

Any expert help and guidance is really appreciated.

Thanks,
Prashanth
