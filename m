Return-Path: <SRS0=vXxs=75=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B333C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Jun 2020 20:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E627420739
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Jun 2020 20:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592338840;
	bh=VnbSghNFJwHgHjauf4cRYoD6DgbA3nhckYXVYPI6iGM=;
	h=Subject:From:Date:To:List-ID:From;
	b=ZxsKDUtUqtWT4N501uOFNC455Tott6qBEk4E+N+7Z0uPSilhj9VP3ZGUDkmZoDy1d
	 pROrRMdED9BQmliHHMWw24m+uUkXCGliCQxTNt48tR4nmAPcCiTwcwiL6pGeY9N4Fx
	 xN6GLE6495bavcAQ4gvZezGNcCRad8odXv0E+n6g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731633AbgFPUUk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Jun 2020 16:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:33200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726856AbgFPUUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 16:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592338840;
        bh=VnbSghNFJwHgHjauf4cRYoD6DgbA3nhckYXVYPI6iGM=;
        h=Subject:From:Date:To:From;
        b=JO37eF01oDQK7KIjun7V0aOrLEqStPyyS3cTjQZ46ARKJmemvaYw/TJUU5IYbhLj2
         tyePylEbfTJNwX2uwxVI+GXqG6GQW1uKoDb5FVdoWjysnx6ilx2p/rEQSTpFUDAacZ
         UyoZEVnHsFdo33LyNhtdGI0omkViIWIByUv+Sxmw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159233884010.2276.4624742300967732685.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 16 Jun 2020 20:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] Add Renesas RPC-IF support (2020-06-16T20:00:20)
  Superseding: [v3] Add Renesas RPC-IF support (2020-06-13T18:37:47):
    [v4,1/2] dt-bindings: memory: document Renesas RPC-IF bindings
    [v4,2/2] memory: add Renesas RPC-IF driver


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
