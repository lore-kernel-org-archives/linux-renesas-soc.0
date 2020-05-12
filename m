Return-Path: <SRS0=HfrD=62=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2B5CA90AF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 May 2020 16:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 343F22054F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 May 2020 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589299244;
	bh=EqKiVeQJpodkNFUj8iOFx43vehne1yOwv/0PMPH0GIs=;
	h=Subject:From:Date:To:List-ID:From;
	b=nuuhDVYG6oGETNEslhdP068/4i/g+48WpV8Bpg/QTvJZe28TN4F3O4iUkLFtIFpE5
	 hbQ/zjjdsjO8o+vhZE8SWqpkFkI73pJvzKE9zHx1pOqfZT6k63cg9sh3hmomDq9L8z
	 xc+vat+iqEnlOmL0LymjdWb9wMs0fA9NAzD1zKHo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgELQAn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 May 2020 12:00:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:46166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbgELQAn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 May 2020 12:00:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589299243;
        bh=EqKiVeQJpodkNFUj8iOFx43vehne1yOwv/0PMPH0GIs=;
        h=Subject:From:Date:To:From;
        b=gDHTwe4sbXwVPOqdJ/RDTPcK/1hPgVrN2DjcpgG23SEiH8dbka2jMiXhowxCMImfW
         F8AQcy2qgmzftZ5R3ACM1V/OM5/MQFOAPiDnSgVWs8UmJPSqDXrNrtBvHmFdHoXKa+
         gPDiiziGBtz8lERoLTykcY/lXZXfcTTnfSvVBU00=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158929924357.7622.3956742359329423710.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 12 May 2020 16:00:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v9] MAX9286 GMSL Support (+RDACM20) (2020-05-12T15:51:01)
  Superseding: [v8] MAX9286 GMSL Support (+RDACM20) (2020-04-17T10:34:20):
    [v8,1/4] dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
    [v8,2/4] media: i2c: Add MAX9286 driver
    [v8,3/4] dt-bindings: media: i2c: Add bindings for IMI RDACM2x
    [v8,4/4] media: i2c: Add RDACM20 driver


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
