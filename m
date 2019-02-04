Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8246C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC1B22082E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="g+thGzna"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728906AbfBDSI6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 13:08:58 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:39270 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbfBDSI6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 13:08:58 -0500
Received: by mail-lf1-f46.google.com with SMTP id z26so614116lfj.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 10:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yu4cqKkS9y756h3einJDErDF0f6zpMtA7KTom2kmnvY=;
        b=g+thGznaPquOLEB6tSiK+6GIcdtIIM52T1tRciYzaSQmQ39awi9LndSodrsKZDqZjS
         LS8jcIImzwcYWyiab+THNyBYHVyoO7x4VWVC3yDvipKD9eucux4bDQUeZ49e3cpR+Jtu
         uIN9LW0UqmnjPBCtnT8jNoCqnh6dwWU9c/GNxJXafA+YOIzMoi6KbEUyomaNWFbiDvpp
         gmww+XCPu4TNJGYlto9/tzkIkWtDwEcl1s5WFspyevWh5vrrwcix8bfo5Rsmy4G8tuQV
         GEYMsULOGiPoB4YJq+mMqwa0Z81Lx4d7OEdYa7AV43ebp3F144uICaHYkwefDAbgJOhC
         5WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Yu4cqKkS9y756h3einJDErDF0f6zpMtA7KTom2kmnvY=;
        b=qz9PlavIPBnH6M2V+zrl4TcqnKfSWXvggRKC9dDMQQu7xs3zyKjB5LShKoaTPDRhHG
         UNOTfjw+QYDAUVaGc/0bHcpFk/t/D3etkQB0tEcjUEtvRTswi0bIBgI9tSew66KjXfJc
         uXCJm6Q60vyogU1EhauP8YrOsfN7wWHGbssftJOQV4VLlDyee9xSB9+L3gNaB+Mrjcjo
         wzRjYGG95nZnMJj8vCKy/c9neUuHRC3P7iO6ig5/ztBY7frBsgwWZdvAGOhpZ1aTfm9u
         /2KOrD7eWgu8GIqNz8dlukWpLf6VsDZMYgCKLR0sKT4kKibKXfOj4Km+jWFpgGVSZsDQ
         bQGg==
X-Gm-Message-State: AHQUAuZlolE1jdTbmEt3fexH5frcyubrJLzJElLUu/xB/mRn60RqWA/V
        92oEWERJsL5fFywDPUJwRVdIbQ==
X-Google-Smtp-Source: AHgI3Ibjk+uoEAZ+O8iBUCbWiI/kOQIaTqeWXunF5fZsDX1N+sebUgkvki+xgrmYDOoTG/AUpHqBcA==
X-Received: by 2002:a19:a98f:: with SMTP id s137mr454374lfe.18.1549303736420;
        Mon, 04 Feb 2019 10:08:56 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id i13-v6sm2792509ljg.82.2019.02.04.10.08.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 10:08:55 -0800 (PST)
Subject: [PATCH v2 4/7] sh_eth: offload RX checksum on R8A7740
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <047ee1f3-b64c-5421-150e-15993049e1ef@cogentembedded.com>
Date:   Mon, 4 Feb 2019 21:08:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Mobile A1 (R8A7740) SoC manual describes the Ether MAC's RX checksum
offload the same way as it's implemented in the EtherAVB MAC...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- added Geert's tag.

 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ renesas/drivers/net/ethernet/renesas/sh_eth.c
@@ -670,6 +670,7 @@ static struct sh_eth_cpu_data r8a7740_da
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
 	.csmr		= 1,
+	.rx_csum	= 1,
 	.tsu		= 1,
 	.select_mii	= 1,
 	.magic		= 1,
