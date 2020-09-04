Return-Path: <SRS0=yd6p=CN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3ED9C43461
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Sep 2020 20:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B07DB20665
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Sep 2020 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599250846;
	bh=Q48bLd/SoXsqmiagwqQ3+tsv5MSlRUoEZHIMA5UwWHc=;
	h=Subject:From:Date:To:List-ID:From;
	b=AQXT4BZwjq/yALk4RjqyWTyj06eMJwtqxe2Ehn3UDN800Flyx2g+hyMtRGwjOSf1L
	 /8v/WoOIQo4j2o/iGP094vfk9caCjos5Z4Lj2zlRIyd0eNXP42kRcuPlEBvkFdzPtb
	 e8s9L5cnvqECkav47Du48U5SsBlF5tn0hFcWc940=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgIDUUq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Sep 2020 16:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:39056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726842AbgIDUUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 16:20:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599250846;
        bh=Q48bLd/SoXsqmiagwqQ3+tsv5MSlRUoEZHIMA5UwWHc=;
        h=Subject:From:Date:To:From;
        b=UOfuxV+g5HNoq1AM1ae4qJynRvEuvPaDTYQQVA6znUUzvYUQdTqoJnYzHVunKJvTn
         RTDI1vwCz62WWEWYLSgI1sE3oWLLSUHConL7tBZ4a/3sJjGaZdQEAjwQ3Mw9p6Hu5v
         g+FCn16fCAIfVGbCxVx141T1J2f5US8DZDRyynYc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159925084596.11235.793691078653411401.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 04 Sep 2020 20:20:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] media: i2c: ov5640 feature enhancement and fixes (2020-09-04T20:18:29)
  Superseding: [v3] media: i2c: ov5640 feature enhancement and fixes (2020-08-13T17:13:34):
    [v3,1/3] media: i2c: ov5640: Enable data pins on poweron for DVP mode
    [v3,2/3] media: i2c: ov5640: Add support for BT656 mode
    [v3,3/3] media: i2c: ov5640: Fail probe on unsupported bus_type


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
