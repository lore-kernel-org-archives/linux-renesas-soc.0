Return-Path: <SRS0=Rjom=QD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA76C282CA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0C4120881
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="d8HNhCYq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfA0Rig (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 27 Jan 2019 12:38:36 -0500
Received: from mail-lj1-f178.google.com ([209.85.208.178]:34753 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbfA0Rig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Jan 2019 12:38:36 -0500
Received: by mail-lj1-f178.google.com with SMTP id u89-v6so12304942lje.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Jan 2019 09:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aHyVNCcWCeqcw7MfnB1A7u/ATcPWbzDNG8u18WnCJZo=;
        b=d8HNhCYqCTc5R7TZKUYzVXqFfPspdTkh0Py4OgB+IpxTbsvj7oGmbPaCN/Kacci31r
         OH7SbvPP3Rsj4Nr/ozz42HK9tL54iwbj1BItGLDY2cshGmk6A2SNFpu+4rFW/l4F6iJ1
         dXQhucPj2PpyvdyPu0bHKXk8qHpwmKx1CMIdRTQLdhz00XP8bVEqcv7arA6j2Ucwbg7J
         Z4tgAQpC1G1X4QD6hGnWtegpVok5TrgQ63qeWzQAyx8+myU/KkfDQjG0d3deQO4RCnET
         EXQHNWSpsT8bNZmJMogK+xOvzpwv/A+jnVDZ2t5Vrnbexr2RkZjyMZcy0pFueNfLovZn
         FipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aHyVNCcWCeqcw7MfnB1A7u/ATcPWbzDNG8u18WnCJZo=;
        b=HxIHjMla29FJrAFKsZ26XCQFvqhwylEcodrCkJvMwIY5jzK+O/bsE8YVSTRCUwKg3H
         WBqbkUQCtPeZEdiAsaInx4Y/fYHpwyGbhC8ez9ZXw8GmlBykxTcUHjdDmw5mwWKNT29i
         lttZ6w9VhG+q0Gy+OKZ+cG2NFPg31oTbFHALHrsF8GNDTihD9p5gK5KxDEidTR0KU2jk
         OlK2QP0I2VsdvsuT+H1aBjEm8NPVzldmg78UHpWw4nB3PK3aA8/WMiL7WyIO+zgs5WHa
         5cfRxkqMe2UHTgFsL9W4je+3AyuqY8TgLqK+zNAQOiZZdWt6vt2ccBAkjN0OLotx3mAE
         uIVA==
X-Gm-Message-State: AJcUukcOK2LP+cGliDEUiMG1ecXSp9uMBi/0AYqP/shDD36GdMDn8j4S
        oQxnqEveDb+upaKOXKliUn3h1g==
X-Google-Smtp-Source: ALg8bN7UOhxEoDtAnGFEpy4wwLXhcvd75ZOcttVkysG8aQ5hSuA5tSD/Ss70L5HzWdwpohNvUZo5DQ==
X-Received: by 2002:a2e:131a:: with SMTP id 26-v6mr14279788ljt.107.1548610714576;
        Sun, 27 Jan 2019 09:38:34 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.150])
        by smtp.gmail.com with ESMTPSA id j138sm2573355lfg.64.2019.01.27.09.38.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 09:38:33 -0800 (PST)
Subject: [PATCH 3/7] sh_eth: offload RX checksum on R7S72100
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0476beba-ea1f-7675-aa08-573b74e84f4e@cogentembedded.com>
Date:   Sun, 27 Jan 2019 20:38:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/A1H (R7S721000) SoC manual describes the Ether MAC's RX checksum
offload the same way as it's implemented in the EtherAVB MACs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -620,6 +620,7 @@ static struct sh_eth_cpu_data r7s72100_d
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
 	.csmr		= 1,
+	.rx_csum	= 1,
 	.tsu		= 1,
 	.no_tx_cntrs	= 1,
 };

