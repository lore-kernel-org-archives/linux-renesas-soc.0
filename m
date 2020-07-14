Return-Path: <SRS0=eQbE=AZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D431FC433E6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 14 Jul 2020 12:40:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADAE822453
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 14 Jul 2020 12:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594730444;
	bh=eH7RllPv2HSamduw5bo/GSC6T7PAQxHDYj9LyqPgiro=;
	h=Subject:From:Date:To:List-ID:From;
	b=f+mMCLBBhl+9Stldk6KzAdtoNnQTHQuP+PyTbpLbcmMHJ8bJhsAZ+HKW4CyF3E6Qu
	 wjRLPMSg36VxfDY29tFA6z1fIv5AiPhYulB00OQFAvg+2WVxW11164JIh51WOx2Uwr
	 ntPniAHgflwqEDH8DNAhy2T6b9RBRGqIyHFVdr0o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgGNMko (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 14 Jul 2020 08:40:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbgGNMko (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 08:40:44 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594730444;
        bh=eH7RllPv2HSamduw5bo/GSC6T7PAQxHDYj9LyqPgiro=;
        h=Subject:From:Date:To:From;
        b=W9cWIIT8CsxndjAfjI0spvh26gBT7mnwRKvFOlUWmj2u85/NAlRIacRX0jBH9fAGz
         zfbvsEWmMK6j7duCc0u7kYHhoPxj5xGiPQLrn7V99hlG2gLappa+4wxRwLkiabxyG6
         rr5At2l1ruYLm8/BV8S/lRPQ6szejZs+ocmPKjr4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159473044399.21635.3239097074955197169.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 14 Jul 2020 12:40:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit (2020-07-14T12:34:18)
  Superseding: [v1] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit (2020-06-17T12:05:09):
    arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
