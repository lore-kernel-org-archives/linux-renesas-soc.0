Return-Path: <SRS0=YZYO=5Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C9DC2BB55
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 10:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D90D12074F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586426438;
	bh=3VuzLt5Dlki7Mc9gzk0X016iAXOvT8qAZA7y9c/a6cA=;
	h=Subject:From:Date:To:List-ID:From;
	b=zCmfqKJvAvuCJ7i3/OPQTEVNYL3FekIk0kWaInQOD2s/sUqpgQ9SMvQI6ftyt7yZ+
	 Mk/CXoUSX3oEdZNzq5tqjURCVWeSJ9Yp7lNZu+0w47HcLfX2t5aJvQ097l/Pjbsmuf
	 nF2HLUCRDl57zGiyPDYrKYpJ7woAlIpmNj6kmq24=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgDIKAi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 Apr 2020 06:00:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:55680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgDIKAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 06:00:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586426438;
        bh=3VuzLt5Dlki7Mc9gzk0X016iAXOvT8qAZA7y9c/a6cA=;
        h=Subject:From:Date:To:From;
        b=QH2Hxzb86CuHQYXDZJNc4vBDxUuccDxkZu9Czi/PSc1K6nJtPNkqU49VPFqJRuuBK
         jOLJyPU7hwcMv+geQEcAVDXEH2CQ9D3lGAwupZjV0S+3s7Q64YB8OIgMUmgo/gUDZE
         PEFCHQvg/Uc62fmS6o/LEKsjKb1jd+KKRyZYCssk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158642643821.8416.1224770708680809679.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 09 Apr 2020 10:00:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ravb: Fix RAVB_RXTSTAMP_TYPE_ALL value (2020-04-09T09:48:50)
  Superseding: [v1] ravb: Fix RAVB_RXTSTAMP_TYPE_ALL value (2020-04-09T06:15:09):
    ravb: Fix RAVB_RXTSTAMP_TYPE_ALL value


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
