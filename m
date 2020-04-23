Return-Path: <SRS0=6hTa=6H=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7C7C55186
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Apr 2020 12:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CEB620857
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Apr 2020 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587645637;
	bh=ZfZGjdyMZMOG85os+QauXPi8YGVJrVSuZkfImOB0oIU=;
	h=Subject:From:Date:To:List-ID:From;
	b=u1VOqCsGHOVI9+afc2NqUf+VlN3Fjmlf1Jmpc1l7oq0kcty+nRN5VMWjFv58/lbCk
	 rM4CASRhmw5ZGB74hR/Tq8Wzjgv98GEovHhuSa7LLgX3/hWp0/6l5UygE88Y4yvmUJ
	 NwB7JImI2TJZV5hPEa/78RMzX/MVO8cE5lhFkRAc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgDWMkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 23 Apr 2020 08:40:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgDWMkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:40:36 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587645636;
        bh=ZfZGjdyMZMOG85os+QauXPi8YGVJrVSuZkfImOB0oIU=;
        h=Subject:From:Date:To:From;
        b=OCGcEoBOCWVdk6ylIFV4tSDHsDWheGNZpMvtFan7QN2PkzZmuO7U8AzW1opBzaw78
         RRqy6cMInUjBrJLZG4KZ08ABHx5NAPY1k7IyiwrNszcP2AHD1dWXGOAQvMVxzqqFvZ
         ZKK9fdDmDMg9zAYQAGq9HAJbUdOJZwQ3icGcfFm8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158764563671.31097.16821487410810775948.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 23 Apr 2020 12:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] mmc: renesas_sdhi: avoid bad TAPs for Gen3 (2020-04-23T12:24:46)
  Superseding: [v1] mmc: renesas_sdhi: avoid bad TAPs for Gen3 (2020-04-22T12:59:13):
    [1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3 revisions
    [2/2] mmc: renesas_sdhi: avoid bad TAP in HS400


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
