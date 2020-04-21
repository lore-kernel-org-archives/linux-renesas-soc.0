Return-Path: <SRS0=kK5T=6F=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F740C54FCC
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 21 Apr 2020 05:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F41C2076C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 21 Apr 2020 05:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587446436;
	bh=baUS7+6cX2EH7UvDAqOWqya9k1Iq1CSZZ7uPcl8Q+9I=;
	h=Subject:From:Date:To:List-ID:From;
	b=QkF74jAMnMAf4ywvDlS/RkIeNu4s8rmF/ta4+7B/iJS84TfCv04/85p+WqzDXtSf3
	 5jwnvnUjildunf7/MohT+iA/CgM66/6qaI6j5ilca0TtbpiKrBtIEY6V85r9rDk4cX
	 4egeZYP0u4LH0/Zb1HtBAkmns9P2vDLUG2+fnAPA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgDUFUg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 21 Apr 2020 01:20:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbgDUFUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 01:20:35 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587446435;
        bh=baUS7+6cX2EH7UvDAqOWqya9k1Iq1CSZZ7uPcl8Q+9I=;
        h=Subject:From:Date:To:From;
        b=uObqN0zzDfNthMCfyxSHbBGciJSppkRBVbFInzqZhg63uqBGpBDA1s69xfsdX1F+A
         t9hMtGo0p9I6fwkJvmwCwX+WgUk1Z5LWsff2FaSyfV4siLOp6BEBCSWwMxy5WJ6n5/
         t5ZYPnv7x51dZPc+Yio9vLUJI5nEoQVPBk+cyGWk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158744643563.3735.11372557977669775637.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 21 Apr 2020 05:20:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema (2020-04-21T05:15:52)
  Superseding: [v4] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema (2020-04-17T07:02:33):
    [v4] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
