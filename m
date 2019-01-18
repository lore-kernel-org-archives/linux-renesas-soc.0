Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA44C43174
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02E8D2087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="aAj98FIW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfARKsc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:32 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:14640 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbfARKsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808508;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=IwYmwDT4SulIsYYduFqM6+3nDTjk+s4bT1hlCaUh7C0=;
        b=aAj98FIWB2UZiwmV9RCZesTpj6L6dhVjaHzMRS8JKxkEPBcZdHIMz90sd19Vuno63r
        4fbZRoG7tJTqLhZEtewcNdIKSAYBE/gVg66wzQGUT4kLROenrmwhag0uVMwP2XdMi0b0
        jdqZSOQbDM2Dvsf+NxW/QKKDyw6qcLY2NgI8fboCwQxqn4CfTP3YIO8TtAX9W454Q/VX
        VWQmJ8XfsVN1AD1csuaq4ZUVN5XKHxZf4ZZWtPNoNZj4imALE0nyDilx3rDMw5y4KvP/
        A7YhtiVQ921QL6nBGMGREjS6PkBlqf0zg9WDJrELQ0dJxcYXO4hXQmiOe3UwFVyozvY/
        ldWw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAmLnyM
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:21 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, linux-serial@vger.kernel.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7779: add HSCIF0/1 pins
Date:   Fri, 18 Jan 2019 11:48:14 +0100
Message-Id: <1547808495-19509-2-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Adds HSCIF0 and HSCIF1 pins, groups and functions for R8A7779.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c | 106 +++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
index 64bace1..4ffeeab 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
@@ -1595,6 +1595,80 @@ static const unsigned int ether_magic_pins[] = {
 static const unsigned int ether_magic_mux[] = {
 	ETH_MAGIC_MARK,
 };
+/* - HSCIF0 ----------------------------------------------------------------- */
+static const unsigned int hscif0_data_pins[] = {
+	RCAR_GP_PIN(4, 20), RCAR_GP_PIN(4, 21)
+};
+static const unsigned int hscif0_data_mux[] = {
+	HTX0_MARK, HRX0_MARK
+};
+static const unsigned int hscif0_data_b_pins[] = {
+	RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13)
+};
+static const unsigned int hscif0_data_b_mux[] = {
+	HTX0_B_MARK, HRX0_B_MARK
+};
+static const unsigned int hscif0_ctrl_pins[] = {
+	RCAR_GP_PIN(4, 18), RCAR_GP_PIN(4, 19)
+};
+static const unsigned int hscif0_ctrl_mux[] = {
+	HCTS0_MARK, HRTS0_MARK
+};
+static const unsigned int hscif0_ctrl_b_pins[] = {
+	RCAR_GP_PIN(3, 9), RCAR_GP_PIN(3, 10)
+};
+static const unsigned int hscif0_ctrl_b_mux[] = {
+	HCTS0_B_MARK, HRTS0_B_MARK
+};
+static const unsigned int hscif0_clk_pins[] = {
+	RCAR_GP_PIN(4, 17)
+};
+static const unsigned int hscif0_clk_mux[] = {
+	HSCK0_MARK
+};
+static const unsigned int hscif0_clk_b_pins[] = {
+	RCAR_GP_PIN(3, 11)
+};
+static const unsigned int hscif0_clk_b_mux[] = {
+	HSCK0_B_MARK
+};
+/* - HSCIF1 ----------------------------------------------------------------- */
+static const unsigned int hscif1_data_pins[] = {
+	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20)
+};
+static const unsigned int hscif1_data_mux[] = {
+	HTX1_MARK, HRX1_MARK
+};
+static const unsigned int hscif1_data_b_pins[] = {
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3)
+};
+static const unsigned int hscif1_data_b_mux[] = {
+	HTX1_B_MARK, HRX1_B_MARK
+};
+static const unsigned int hscif1_ctrl_pins[] = {
+	RCAR_GP_PIN(0, 21), RCAR_GP_PIN(0, 22)
+};
+static const unsigned int hscif1_ctrl_mux[] = {
+	HCTS1_MARK, HRTS1_MARK
+};
+static const unsigned int hscif1_ctrl_b_pins[] = {
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 6)
+};
+static const unsigned int hscif1_ctrl_b_mux[] = {
+	HCTS1_B_MARK, HRTS1_B_MARK
+};
+static const unsigned int hscif1_clk_pins[] = {
+	RCAR_GP_PIN(0, 18)
+};
+static const unsigned int hscif1_clk_mux[] = {
+	HSCK1_MARK
+};
+static const unsigned int hscif1_b_clk_pins[] = {
+	RCAR_GP_PIN(2, 4)
+};
+static const unsigned int hscif1_b_clk_mux[] = {
+	HSCK1_B_MARK
+};
 /* - HSPI0 ------------------------------------------------------------------ */
 static const unsigned int hspi0_pins[] = {
 	/* CLK, CS, RX, TX */
@@ -2618,6 +2692,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(ether_rmii),
 	SH_PFC_PIN_GROUP(ether_link),
 	SH_PFC_PIN_GROUP(ether_magic),
+	SH_PFC_PIN_GROUP(hscif0_data),
+	SH_PFC_PIN_GROUP(hscif0_data_b),
+	SH_PFC_PIN_GROUP(hscif0_ctrl),
+	SH_PFC_PIN_GROUP(hscif0_ctrl_b),
+	SH_PFC_PIN_GROUP(hscif0_clk),
+	SH_PFC_PIN_GROUP(hscif0_clk_b),
+	SH_PFC_PIN_GROUP(hscif1_data),
+	SH_PFC_PIN_GROUP(hscif1_data_b),
+	SH_PFC_PIN_GROUP(hscif1_ctrl),
+	SH_PFC_PIN_GROUP(hscif1_ctrl_b),
+	SH_PFC_PIN_GROUP(hscif1_clk),
+	SH_PFC_PIN_GROUP(hscif1_clk_b),
 	SH_PFC_PIN_GROUP(hspi0),
 	SH_PFC_PIN_GROUP(hspi1),
 	SH_PFC_PIN_GROUP(hspi1_b),
@@ -2783,6 +2869,24 @@ static const char * const ether_groups[] = {
 	"ether_magic",
 };
 
+static const char * const hscif0_groups[] = {
+	"hscif0_data",
+	"hscif0_data_b",
+	"hscif0_ctrl",
+	"hscif0_ctrl_b",
+	"hscif0_clk",
+	"hscif0_clk_b",
+};
+
+static const char * const hscif1_groups[] = {
+	"hscif1_data",
+	"hscif1_data_b",
+	"hscif1_ctrl",
+	"hscif1_ctrl_b",
+	"hscif1_clk",
+	"hscif1_clk_b",
+};
+
 static const char * const hspi0_groups[] = {
 	"hspi0",
 };
@@ -3005,6 +3109,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(du0),
 	SH_PFC_FUNCTION(du1),
 	SH_PFC_FUNCTION(ether),
+	SH_PFC_FUNCTION(hscif0),
+	SH_PFC_FUNCTION(hscif1),
 	SH_PFC_FUNCTION(hspi0),
 	SH_PFC_FUNCTION(hspi1),
 	SH_PFC_FUNCTION(hspi2),
-- 
2.7.4

