Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E1DC43613
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DBD7204EC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="cTVx+JTZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfARKsb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:31 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:12320 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfARKsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808508;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=q+3aMLFm/dSf5vpFOBuXsO7oDeRRaRFGJ0gybGgomIQ=;
        b=cTVx+JTZk4ZXRZ/9Eebl8u3zTjbeHqC/T5Q3vOKsdAraGQn6laxYTsKDkZYrmBtrSA
        1v723/g+fTA1CWgmGtY07UxU5i2pjssIYVmVlTUT4B0Y9z2uhDA7Ollaan8DgPA51+9+
        LAobK/akovtfNk2+cznM8onmfxcN5fSzVNTil2fteOTS9GraxEuL31t9D7/ekrtfI7MD
        BD5GPTdKrwy8JlTLixpZa4PsxoE2pUSyoB4ewGUkjoLFdI8m7NQklATe6rM8t00Dgxbm
        UjmYrs6HAe8k7k2lkNWybxnVOvTkn6JAFyaaGmJuS3TGrWeV7+n8Gb9jBV5Jqkncvi54
        PF2A==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAmJnyL
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:19 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, linux-serial@vger.kernel.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 0/2] ARM: shmobile: r8a7779: HSCIF support
Date:   Fri, 18 Jan 2019 11:48:13 +0100
Message-Id: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This is the r8a7779 portion of the ancient "ARM: dts: r8a777[89]: HSCIF
support" series, this time with PFC support and with the address sizes and
clock indices fixed in the device tree. Thanks to Geert for the review.

This series is untested because I do not have up-close access to a Marzen
board at this time.

CU
Uli


Ulrich Hecht (2):
  pinctrl: sh-pfc: r8a7779: add HSCIF0/1 pins
  ARM: dts: r8a7779: Add HSCIF0/1 device nodes

 arch/arm/boot/dts/r8a7779.dtsi       |  26 +++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c | 106 +++++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

-- 
2.7.4

