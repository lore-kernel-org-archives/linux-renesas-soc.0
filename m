Return-Path: <SRS0=llTS=BR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6CAC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Aug 2020 14:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 197E920866
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Aug 2020 14:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596810044;
	bh=Bsnr1LtVDxJjYXeKRpECT0Uu7KVuFCj0g6oZdgsnn7Y=;
	h=Subject:From:Date:To:List-ID:From;
	b=m2pFbib93zuXVNbtAkX9UnCZMWn6tTqROEqY7w0jdW2xzuFg63x3lQO1iMoh73uB5
	 kMrZTY/cd0kfn/hjwIJjvu85htK6rqxCQExaRVieVNDUjIQpOZhYRik8m/F2Yr3eii
	 J7tX5dbUnVp711Vzv2vl/IE8TW6fzHLQ4gjEChXw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgHGOUn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 7 Aug 2020 10:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgHGOUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 10:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596810043;
        bh=Bsnr1LtVDxJjYXeKRpECT0Uu7KVuFCj0g6oZdgsnn7Y=;
        h=Subject:From:Date:To:From;
        b=JDIBfa+h5NXTGo/hb8A/FD+3IPi0tmsVUqQGF5byFceO1IskAKO35YAKaSSEtKOny
         L+1WU/D8rD7hO93y1XagB09hTy4e51W8tyVgDfIyA2B2JtZg8j76VAhn7BbCkEdXmQ
         ueLzv3CaibpUovBFKDmhDcQ4FMv886mbR68rxuSQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159681004328.14237.17596777642028379150.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 07 Aug 2020 14:20:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: pinctrl: sh-pfc: Convert to json-schema (2020-08-07T14:13:45)
  Superseding: [v1] dt-bindings: pinctrl: sh-pfc: Convert to json-schema (2020-04-17T14:09:20):
    [RFC] dt-bindings: pinctrl: sh-pfc: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
