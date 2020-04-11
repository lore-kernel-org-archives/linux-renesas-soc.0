Return-Path: <SRS0=5Ce2=53=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1852DC2BA2B
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 11 Apr 2020 09:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D77032084D
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 11 Apr 2020 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586598035;
	bh=PxEBaxeWRFIzZhF4yoN8XuVxj+bapep6YZjgKpxjmD4=;
	h=Subject:From:Date:To:List-ID:From;
	b=VPLoaSp90ci9lLWHUHbG/+I3plTcffdg1KDNMQp6/ZqpKQNpd1i40K1Zwwt3y+PD5
	 xbs13S1iwYjHeaQHFF1QQ6+vXqW5C7aqiehWToWru6R2eXLRpsMFIqACImcLWpJopS
	 YJ0RAPAKPvj1eLM5NUVBxV5wqqDPgVDVhYdep/ao=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgDKJke (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 11 Apr 2020 05:40:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbgDKJke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Apr 2020 05:40:34 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586598034;
        bh=PxEBaxeWRFIzZhF4yoN8XuVxj+bapep6YZjgKpxjmD4=;
        h=Subject:From:Date:To:From;
        b=Vx+0swHoBc5CnMOH1MIMs9YndCHJbkAFy5V1zNrjqFVlsWxHfwrnX4eZzGE07NMjh
         SJyQYcTH6uYjhA4yn70zHMOZu+H/4WjiBq9GBNol2eNTQTNAHZ9GYUZqb44i7glYVi
         +N47YBv01eUZpD5O5kOO2P+/B/PMtF3YOKKNyBA0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158659803494.17390.4697087187207867161.git-patchwork-housekeeping@kernel.org>
Date:   Sat, 11 Apr 2020 09:40:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: thermal: rcar-gen3-thermal: Convert bindings to json-schema (2020-04-11T09:27:19)
  Superseding: [v1] dt-bindings: thermal: rcar-gen3-thermal: Convert bindings to json-schema (2020-03-10T00:12:55):
    dt-bindings: thermal: rcar-gen3-thermal: Convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
