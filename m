Return-Path: <SRS0=7H4x=AH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7C6C433E1
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Jun 2020 17:40:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45727207FC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Jun 2020 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593193246;
	bh=ILggvNn9SU/kEZzA46OazpUkM4zsaSSOlmulzoFhk8Y=;
	h=Subject:From:Date:To:List-ID:From;
	b=UYTnnsgNe2SHjcbRfC96IelOl4cKrx1OYpSoXxCnbZVaDKVNBg634ip39Tz/xBGNW
	 CYx/I6einjeW7kzaa1AdfnCpdWR9inXOZYbc6LHa+FSPERb1qKnyIj3KS8AU6vcrZy
	 qh+q6Th0bMv+SOY6oBNwiGb3fa3X9mHqeLQH39Mo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgFZRkp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Jun 2020 13:40:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:47312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgFZRkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 13:40:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593193245;
        bh=ILggvNn9SU/kEZzA46OazpUkM4zsaSSOlmulzoFhk8Y=;
        h=Subject:From:Date:To:From;
        b=0qj3GrA0Udv3+q/Ay2b44lxDKqNcm8cqIfLxNMfizeZCiieCt5DUqGmKbJKUDa85A
         7Fi+vR9EqeByg5xo9pMIKZtUxrmzYnLTUgo5veBZ394hchOw67kfubdl2SFsk+fCJ8
         tCvJuZH892hyGynM/ZzlJEAskpGrmFKN7BCo0AsY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159319324568.6260.14144986303808155965.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 26 Jun 2020 17:40:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] acpi: thermal: Fix error handling in the register function (2020-06-26T17:37:45)
  Superseding: [v4] acpi: thermal: Fix error handling in the register function (2020-05-28T19:20:42):
    [v4,01/11] acpi: thermal: Fix error handling in the register function
    [v4,02/11] thermal: Store thermal mode in a dedicated enum
    [v4,03/11] thermal: Add current mode to thermal zone device
    [v4,04/11] thermal: Store device mode in struct thermal_zone_device
    [v4,05/11] thermal: remove get_mode() operation of drivers
    [v4,06/11] thermal: Add mode helpers
    [v4,07/11] thermal: Use mode helpers in drivers
    [v4,08/11] thermal: Explicitly enable non-changing thermal zone devices
    [v4,09/11] thermal: core: Stop polling DISABLED thermal devices
    [v4,10/11] thermal: Simplify or eliminate unnecessary set_mode() methods
    [v4,11/11] thermal: Rename set_mode() to change_mode()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
