Return-Path: <SRS0=2rCm=77=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABF6C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Jun 2020 15:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8753520734
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Jun 2020 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592493642;
	bh=e3MDJr8vuN9fu8nS5TkB1fdWgYzcMlj1eBUx1VKGHRs=;
	h=Subject:From:Date:To:List-ID:From;
	b=NNN4IZOAQq80vLyl53N3ICnG0pMxjVWnp3NXmO/Tg20LFOv+JHopUwFDQGFRVFQy2
	 IVbXro4aia9aMiyhv76HDxxFib5ioaNlaMd8TTeAl9JTbtSG32TzwFCex1zaHzSXWs
	 UbE/TjWmG5c7zG6OYqnhNwiodKCkg1Dx2CX9C6uU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgFRPUm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 18 Jun 2020 11:20:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727045AbgFRPUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 11:20:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592493641;
        bh=e3MDJr8vuN9fu8nS5TkB1fdWgYzcMlj1eBUx1VKGHRs=;
        h=Subject:From:Date:To:From;
        b=qg4IvPPLSfClk+wjqJi1Ciy6MPrmZ+vA5JEYz+pwJ7lxx1E4yNqtBfJ0PwCKLLBQx
         jNxkiEeaGAAanMj4FaJEGu8HwnL/T+iRC3tKyDb1S4dsY+YVKy/VKOQ6Y7MWhTgQCO
         PbpRISNmB9g79ut7CAFm7qBE2+3yvbQBZQ3/7G1I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159249364176.11838.7191906533138741875.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 18 Jun 2020 15:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] i2c: sh_mobile: implement atomic transfers (2020-06-18T15:05:32)
  Superseding: [v1] i2c: sh_mobile: implement atomic transfers (2020-06-10T19:33:11):
    i2c: sh_mobile: implement atomic transfers


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
