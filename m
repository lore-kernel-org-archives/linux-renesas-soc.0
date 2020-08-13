Return-Path: <SRS0=eZfK=BX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A0EC433E1
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Aug 2020 17:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19FFD20656
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Aug 2020 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597339243;
	bh=eq5KDfc+i4pAs40DKaMzNIv6Pv/gU4f5gbeOTE+PTg0=;
	h=Subject:From:Date:To:List-ID:From;
	b=nQCj0tW+yb8+ow0OlV7kQ3vQEZWZ7U0aLhhHRQE2JSOZrZXGS1/V/ohmIkNjU4SNE
	 4xFIxYO555m98JA6qNwbIiQSU8Kh5/kUxFYQpRyLpi5FJ+5VKglS2zOvOR11c5hpWK
	 ebRxSy5QptAWGT9uENipEWvGag/lPj/Dhg9rG62s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgHMRUm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Aug 2020 13:20:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:46842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgHMRUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 13:20:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597339240;
        bh=eq5KDfc+i4pAs40DKaMzNIv6Pv/gU4f5gbeOTE+PTg0=;
        h=Subject:From:Date:To:From;
        b=tJXDUEix/RBWQMyCCvDEQmk2PdU4XlAu+tMpIi+Poah88pTs3xV70M8RkUhqGXarp
         wUA+1LpC88VQui5GzwP5rIJ6Ph+H8Ub2cmvYqjfWDAg0+jceAe3nXAtQAuRZP6u14P
         EBn95eSeNw2F8kAIvCEBGUOasEWWbIV59/HCFJr4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159733924083.12762.13931564059867248068.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 13 Aug 2020 17:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] media: i2c: ov5640 feature enhancement and fixes (2020-08-13T17:13:34)
  Superseding: [v2] media: i2c: ov5640 feature enhancement and fixes (2020-08-03T14:31:43):
    [v2,1/4] dt-bindings: media: i2c: ov5640: Document bus-type property
    [v2,2/4] media: i2c: ov5640: Enable data pins on poweron for DVP mode
    [v2,3/4] media: i2c: ov5640: Add support for BT656 mode
    [v2,4/4] media: i2c: ov5640: Fallback to parallel mode


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
