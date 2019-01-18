Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2561C43612
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA8C52087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="LEByG5WR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfARKsa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:30 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162]:19198 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfARKsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808508;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=8MQxLMZpzC8EsFCSWUn3rcN7blSoasB4WS4WB9HpOqk=;
        b=LEByG5WRahT1M1NjdrrPYstcyqSq0MkHpcHmLDufqwIvj+I0uwO0i3ps1nnc/90jay
        rqYXyLQKMBlYXJRCfPRqjL3tHkq/02bxqybmvM99/VPkXr1vy1OHKwg2oWUDRJwi/RS3
        VikVr0s51OArwETr/KKYhqcusC3Ib1I2q3XJncWnCOeAGj5moy72Gy+TFpPxbPHlip80
        C+uWn3mdTzQfHoajQgC5mdKgqKr+IKo8HCfNRJjxgDFQYdv/VUnH9/lFRuPULN8ZSr1l
        0JnYfnISiVcmtLT7MQC8MSG092JRxrDkGv2n5iwGYmt2vwoBr1wdNf2aPf3LFH6Wlr3s
        FyGg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAm2ny6
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:02 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 0/5] H3/M3-W cpuidle support
Date:   Fri, 18 Jan 2019 11:47:49 +0100
Message-Id: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This series adds CPU idle support for H3 and M3-W. It's a straight up-port
from the BSP.  This revision removes the superfluous status properties from
the idle states and fixes Khiem's e-mail address.

I don't think we have any information on whether all M3ULCB boards have an
ES1.0 SoC yet, do we?

CU
Uli


Dien Pham (2):
  arm64: dts: r8a7795: Add cpuidle support for CA53 cores
  arm64: dts: r8a7796: Add cpuidle support for CA53 cores

Khiem Nguyen (2):
  arm64: dts: r8a7795: Add cpuidle support for CA57 cores
  arm64: dts: r8a7796: Add cpuidle support for CA57 cores

Takeshi Kihara (1):
  arm64: dts: r8a7796-m3ulcb: Disable cpuidle support for CA53 cores

 arch/arm64/boot/dts/renesas/r8a7795.dtsi       | 30 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 22 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi       | 28 ++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

-- 
2.7.4

