Return-Path: <SRS0=ZXdK=BP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2511CC433E4
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  5 Aug 2020 19:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07C55206D4
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  5 Aug 2020 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596655281;
	bh=bJY33oXGeT+jZq5fVmbvmXW61t1Eh4mS4M9z0Z2mfDs=;
	h=Subject:From:Date:To:List-ID:From;
	b=Tx+mXJshPFAUMO7oI9yf4OKk0M+s6lOy2LOQTREtaiED6qyyI2XklsX05+xt+Nd5/
	 FwGm6V5X3Lkt5BvVXQ266K0qGgTyMjm2GczzG5allm7hx6WtZQqjfywjQqpQsqq/CL
	 WB2SIG8FNc28S/a+EPMgLKT6pQ+z80z/s0vO+DEc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgHETVT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 5 Aug 2020 15:21:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:43388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728850AbgHERoA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 13:44:00 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596649243;
        bh=bJY33oXGeT+jZq5fVmbvmXW61t1Eh4mS4M9z0Z2mfDs=;
        h=Subject:From:Date:To:From;
        b=ZkmZfGBYOSzzr5zFjT8yOJJzxeaAidVRk2Ymw+l3C9GQWCndlo+K7q7cv6njz0g97
         AVZEVI+WEsyuYVA867575L7X5YxCa7fYkhtREJEmrBe/hMCS0uuAJT8T9C+EgvBPOg
         DnhHMLXXTTi9ldjZ7v8AJUs4YXkNyR+9Cpr9H6Bk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159664924297.11376.1365804225468179745.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 05 Aug 2020 17:40:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting (2020-08-05T14:26:34)
  Superseding: [v1] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting (2020-07-29T12:26:02):
    ARM: dts: iwg22d-sodimm: Fix dt nodes sorting


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
