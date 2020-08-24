Return-Path: <SRS0=Azr1=CC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A20C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Aug 2020 11:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2A03206B5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Aug 2020 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598266842;
	bh=QCVJqOmNQn9I28bo++4y+9sfLYy55i+OrBxRKSuaMD4=;
	h=Subject:From:Date:To:List-ID:From;
	b=sjqJLY98yJxPacNi1nQzwfG3czc8MfCKmDbVW90rUQY+w/y/nfMCSsVeCHe/5AdRV
	 oQKC/rfWrQGiDQ40vSeeDSAhyMCu/tTVJi6XNXG/TKA0T8yKI6WC0e/m+fobz+xhXf
	 kf0SUi+GHLaGphsg1NGULFscNQCOyqFql6benEHE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgHXLAm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 24 Aug 2020 07:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgHXLAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 07:00:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598266840;
        bh=QCVJqOmNQn9I28bo++4y+9sfLYy55i+OrBxRKSuaMD4=;
        h=Subject:From:Date:To:From;
        b=Fr1TB2zElTJMS1fkIoCl0j/M0ryAc/PGLYIbq+loZgmbQoR93MZMbRBTJtba/CBBD
         N0+XoBQwoBZf/feurm8cxSlj6Q+j51b2A+aRZ9DfQe8ZVbUzWOQds1A673G3W3hWWN
         v9aXoLg0UznyXxaEU+RWmIH4IDBm/5euD2H8NKW0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159826684058.13316.4769220493820164204.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 24 Aug 2020 11:00:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bindings: media: imx274: Convert to json-schema (2020-08-24T10:58:50)
  Superseding: [v1] dt-bindings: media: imx274: Convert to json-schema (2020-08-18T12:18:21):
    dt-bindings: media: imx274: Convert to json-schema

Latest series: [v3] dt-bindings: media: mt9v111: Convert to json-schema (2020-08-24T10:59:19)
  Superseding: [v1] dt-bindings: media: mt9v111: Convert to json-schema (2020-08-17T16:01:29):
    dt-bindings: media: mt9v111: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
