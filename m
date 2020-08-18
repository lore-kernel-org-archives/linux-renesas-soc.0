Return-Path: <SRS0=zzKo=B4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE569C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Aug 2020 15:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E7B220639
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Aug 2020 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597762850;
	bh=duBgEmmR2B/cvkc7mrkDtJG2qbsz4pi0ZPev1gYJFQs=;
	h=Subject:From:Date:To:List-ID:From;
	b=K9L1J0mCWT49eoG75GOD/07l8xaRrrasQ+IEek1DytwAx+NPxJD4Dd3l03z9J7Jcv
	 07oDep2fTOuekYyKQnxPyhpiE1ihHj44nIUJKuwll5ofM9Ti2m6goXqU6Ig8Q/kR9j
	 5ikkLLJ/o+b0thLJgWOIFYZjiu6L/dyHn9xae78M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgHRPAt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Aug 2020 11:00:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:33088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbgHRPAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 11:00:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597762841;
        bh=duBgEmmR2B/cvkc7mrkDtJG2qbsz4pi0ZPev1gYJFQs=;
        h=Subject:From:Date:To:From;
        b=EdY4dQLIcMzbhooUEibOgjZSYk1H1hcsw7CZrQqvO6jAd8puCzcFAJuHDOYjkgp71
         OzTqxgvkdwc9uQhztvZ+yeSFaArCC82FEr3d9DTYThHfKzZQF4cq9Lu+mGQKP+XjYz
         +JPuBi5c6arQy6X2eDbAgLhuS5TnKGopuoc+QPlM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159776284108.30725.7542466905811523056.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 18 Aug 2020 15:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] dt-bindings: media: ov772x: Convert to json-schama (2020-08-18T12:20:09)
  Superseding: [v1] dt-bindings: media: ov772x: Convert to json-schama (2020-08-17T15:59:08):
    [1/3] dt-bindings: media: ov772x: Convert to json-schema
    [2/3] dt-bindings: media: ov772x: Make bus-type mandatory
    [3/3] dt-bindings: media: ov772x: Document endpoint props


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
