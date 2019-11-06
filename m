Return-Path: <SRS0=ZRe+=Y6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC744C5DF63
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Nov 2019 10:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D41520869
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Nov 2019 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573036841;
	bh=H/+57jYWtnEpeUna1217Af9xMSUOqOg+F4Vw+bDuvIM=;
	h=Subject:From:Date:To:List-ID:From;
	b=pCeYWPZ4oi3bJ8ycH2A/M3IHlq4P7CxQMlPN2J3LC3jOMZ1lqFTxffJLRGOSyQuBE
	 ywwM6a06rBkp+sTGKdxRoJhEz1kV8BOMvrqWjdXKPCy7Gfhf/+Q9PSUARdR2uR8s9P
	 8glAgsrR6Sh7XLeGJHJIGyfTpx3O8Ao+tqCxrh24=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731151AbfKFKkl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Nov 2019 05:40:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:39640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727239AbfKFKkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 05:40:41 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573036840;
        bh=H/+57jYWtnEpeUna1217Af9xMSUOqOg+F4Vw+bDuvIM=;
        h=Subject:From:Date:To:From;
        b=zh/cj4DKp/YuqiQImiBh6eA9Cg8Ns6U0KH+XbW9iRjBg00Lwu8cut9uaRMRfOaA2Y
         iJ1dvyMdxlvQd/+hGJKzVMlBO3gA6F8/2CxyFpCVGrJsSnBTY7hzh5ZXbLQ5XFDSWq
         ufoxSY/5drJhR+fKj0LgiGSWEpSxaf1BB4BHNAlk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157303684058.6047.8490887809936769683.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 06 Nov 2019 10:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: usb: renesas_usbhs: convert bindings to json-schema (2019-11-06T10:34:43)
  Superseding: [v1] dt-bindings: usb: renesas_usbhs: convert bindings to json-schema (2019-10-23T08:20:08):
    dt-bindings: usb: renesas_usbhs: convert bindings to json-schema

Latest series: [v2] dt-bindings: usb: renesas: usb3-peri: convert bindings to json-schema (2019-11-06T10:34:53)
  Superseding: [v1] dt-bindings: usb: renesas: usb3-peri: convert bindings to json-schema (2019-10-23T08:20:16):
    dt-bindings: usb: renesas: usb3-peri: convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
