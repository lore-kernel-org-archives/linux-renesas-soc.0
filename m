Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:61441 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751926AbeEGOjT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 10:39:19 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] ARM: dts: r7s72100: Correct interrupt types
Date: Mon, 7 May 2018 14:39:13 +0000
Message-ID: <TYXPR01MB1568D369782351FB288EA8328A9B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <1525699489-6172-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525699489-6172-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday, May 07, 2018, Geert Uytterhoeven wrote:
>=20
> 	Hi Simon, Magnus,
>=20
> RZ/A1H peripherals use a mix of level and edge interrupts.
>=20
> This patch series corrects the interrupt types for watchdog and RTC from
> edge to level, to match the datasheet.
>=20
> Is there any easy way to test this?
> The watchdog interrupt is not used by the Linux driver.
> The RTC interrupts are used, but how to trigger them?

Honestly, I can't remember if I did that for a reason, or it was just an
oversight.

Like you mentioned, the watchdog driver does not use interrupts, it=20
simply resets system on overflow.

As for RTC, I thought I remember setting an 'alarm' and testing the code
did work. But, I can't seem to find any leftover test scripts (so did I
really do that????)

I would say make the changes anyway as they should match what is in the=20
hardware manual.


Chris
