Return-Path: <SRS0=m7mt=5K=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEA3C43331
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Mar 2020 10:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E880E20775
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Mar 2020 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585130443;
	bh=eEPRzPyzC3TV5K8T5L6Q0hxmVdznzmxbpP4Zi26dWpU=;
	h=Subject:From:Date:To:List-ID:From;
	b=DS9yADh3L7+yoN7aDFj1dZF6j67Wkq1XBZz03G1dwgXvPY3AjJS8YTQGt/nUk4cQS
	 xjGqCdWdF5dVega2TAgIWgRg6wwg/ZmGHv2QFRHx/rkAoS2XvktFN76ZiINB6e+YpL
	 hGlSG1F6xE+XEjTRzUy5PBWQkTkBeWwYcp4qC3/A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgCYKAm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 25 Mar 2020 06:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbgCYKAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 06:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585130442;
        bh=eEPRzPyzC3TV5K8T5L6Q0hxmVdznzmxbpP4Zi26dWpU=;
        h=Subject:From:Date:To:From;
        b=gEaKE7u/FwT4OhI5QBFOE6xFrG4JwJHdO0vVCEK1faPv2KCTWRubTOTQPywCIC89T
         AgeQgSLB1XE6fOp04VUAa7NnTrWqb2GGNC+5+F++8AU0AA/IZMq9L2Vz08SBJb8vik
         YWB14r73ua5S7q4AAvNx/gA3CWP5UxCLtplPqxBc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158513044219.2693.16758369232831744461.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 25 Mar 2020 10:00:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: serial: sh-sci: Convert to json-schema (2020-03-25T09:57:21)
  Superseding: [v1] dt-bindings: serial: sh-sci: Convert to json-schema (2020-03-06T09:07:20):
    dt-bindings: serial: sh-sci: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
