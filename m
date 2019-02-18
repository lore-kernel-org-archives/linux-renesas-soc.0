Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A2BC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 597992147A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="J43XOHBn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbfBRKs2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 05:48:28 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:45398 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbfBRKs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 05:48:28 -0500
Received: from penelope.horms.nl (unknown [62.119.166.9])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BE27F25BE9A;
        Mon, 18 Feb 2019 21:48:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550486902; bh=Haf2YEuZeFbTwBtmNtKMkzYthTruAdqAS/QPItlEcaU=;
        h=From:To:Cc:Subject:Date:From;
        b=J43XOHBnKVVjGQz0S774+C4Axe1QqlZHkpz5ukhie5PiTrFYApGgcPYgHuEKqax8a
         isJIP2C3rnZ4bAsQcuhG4G/vqSnFwbWfCDLcZy4i6V/BB7mGpbqnpbXmRjlefA7DF5
         sMIS4zX2OuNQ6C6X7uFpuIRGdP41BeHTTSQ8d0Lw=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 7786DE21807; Mon, 18 Feb 2019 11:48:06 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v5.1
Date:   Mon, 18 Feb 2019 11:48:03 +0100
Message-Id: <cover.1549624030.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v5.1.

I apologise for the lateness of this submission.
It somehow got stuck in my to-send queue.


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v5.1

for you to fetch changes up to c051dc5e3cea482ceb019028ddde67b7cb921e85:

  dt-bindings: arm: renesas: Fix SoC mismatch for Stout (2019-01-30 10:58:00 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v5.1

* Convert Renesas board/soc bindings to json-schema
* Correct SoC missmpatch for R-Car H2 (r8a7790) based Stout board
* Document RZ/A2M (r7s9210) based EVB
* Document RZ/G2E (r8a774c0) based cat87[45] boards

----------------------------------------------------------------
Chris Brandt (1):
      dt-bindings: arm: renesas: Document RZ/A2M EVB

Fabrizio Castro (1):
      dt-bindings: arm: renesas: Add si-linux cat87[45] boards

Geert Uytterhoeven (1):
      dt-bindings: arm: renesas: Fix SoC mismatch for Stout

Rob Herring (1):
      dt-bindings: arm: Convert Renesas board/soc bindings to json-schema

 Documentation/devicetree/bindings/arm/renesas.yaml | 238 +++++++++++++++++++++
 Documentation/devicetree/bindings/arm/shmobile.txt | 155 --------------
 MAINTAINERS                                        |   4 +-
 3 files changed, 240 insertions(+), 157 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/renesas.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/shmobile.txt
