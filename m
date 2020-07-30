Return-Path: <SRS0=rkh3=BJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82353C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 Jul 2020 10:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61B9F2082E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 Jul 2020 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596104444;
	bh=bmWfATqGyM4gEUJsIMaoocKpgC6+hwGxX+H0b3U3mds=;
	h=Subject:From:Date:To:List-ID:From;
	b=YPekf9udHbavpGF+EMnIaul+WkzHDRvySLjX4S4SDcu4At6L8XgW4Md5+pdu9NArA
	 KimpC9rAw3YqHIi7Ls2j51Z9eGZEkQ0uhqd7xFZmDJtSIpIO8zvH3aOY0ApsCqfb4j
	 RYJ3gABcvULj2Bh8HlTQ/XilHpZiGFm9Iagku0hI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgG3KUo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 30 Jul 2020 06:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:59816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgG3KUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jul 2020 06:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596104443;
        bh=bmWfATqGyM4gEUJsIMaoocKpgC6+hwGxX+H0b3U3mds=;
        h=Subject:From:Date:To:From;
        b=NogoO+EEhHmNHWiJR2zAlJL2Ac4WKYGgsWSfdBTkmFnt6Sx1THEyCUupr8AACKuG+
         EDZQF7eMExKTq26a1NysOn8UrTgcJ+8zZZdIJvU8KdvcbCRtw7JCB+dy90Ye0dAcZd
         m1MdgTfZ8Vq3ySTqvlL6dWyWqqRWijy/K6JQH2Os=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159610444348.7990.13995462596029808650.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 30 Jul 2020 10:20:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ravb: Fixed the problem that rmmod can not be done (2020-07-30T10:01:51)
  Superseding: [v1] ravb: Fixed the problem that rmmod can not be done (2020-07-30T03:56:49):
    ravb: Fixed the problem that rmmod can not be done


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
