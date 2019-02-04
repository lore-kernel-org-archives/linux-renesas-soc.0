Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CE6C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CCEF20820
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:01:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="htwrS8i4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbfBDSB3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 13:01:29 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:38874 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbfBDSB3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 13:01:29 -0500
Received: by mail-lf1-f50.google.com with SMTP id j15so601293lfh.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 10:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=bguRQTDMlMmqVCeW4DMBXahpO1jHxKyEum00RMTfNZc=;
        b=htwrS8i4ZBa3rvwAMLQjV6DadMcfCWlNZg3BhksKOnvzy2h7nORstKUUA9ni2Y5t3e
         rOGlM5SDRmVXD5GUeoqnsqgbAabUpkJFoFGcYsEVA2jWpTnQH4/heXcKZOs4rLP5UerJ
         cAkgAYAVDMhUlOKR3PNAkAidGemLMrw+eIHGvEV0tGWK73dShb1pOpm3bTE+lRUwQGXm
         Ks88Q9GK3enL9n+PDQtDPpKX8kBrmuJrFaPUxnctCBtAwBjbisvhKcW05pX5hht+sDky
         yUfX9C125kKUsQ3zLXDPcQwVMXR4cSD8p0x/VBUAFf0XQRL6oD0TS1G79i55MLJD8uBK
         a3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=bguRQTDMlMmqVCeW4DMBXahpO1jHxKyEum00RMTfNZc=;
        b=ewNBewxfEApuGgCp2BsBG9gJR+dgdtsJnN5mjbcaZnuB+AExXTQnlZYmMQ8efCKz5n
         oBUZHQwvtGV3aoRJJFz8SezNMDlggK6xCwnBQBP8hs68tuA2RP+Ys7j8tWr5sPUyAhxM
         nEqsYdRY0rhfAfhaE2v7mlHZVbFWom9qa7GJLSP3D21IKkCJ/iRDpMC5rszlM1c9cuGN
         wC6cFLj3XMvT9PAvya90PZfUtn7X02Yu7V0v++wOxPa7r4nK2BQD93ywF3eNalweIFsv
         96aXAEN+Ln3G+9bP59lC8Dsg8bX3Hd2TB7/E8i4RA53mFSWWnK3TSeWCRqAYouZtYZa1
         kBkA==
X-Gm-Message-State: AHQUAuZ2EhEz9CF06WiEA34sDFuNfC6FAO3SsxDZceI/g2ajNfd2G7Uh
        i6X6tV2nNM9yQXHuGFLD1hNp+g==
X-Google-Smtp-Source: AHgI3IY4v3Dx/s9f1FpEZLFWnnH3VAg0aHVsjnDgejLnCvKqQbfwb/07eUnfIO50YK0GnVfOwzaC5Q==
X-Received: by 2002:a19:c115:: with SMTP id r21mr385881lff.144.1549303287342;
        Mon, 04 Feb 2019 10:01:27 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id e19-v6sm2873087ljf.67.2019.02.04.10.01.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 10:01:25 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/7] sh_eth: implement simple RX checksum offload
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Date:   Mon, 4 Feb 2019 21:01:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

Here's a set of 7 patches against DaveM's 'net-next.git' repo. I'm implemeting
the simple RX checksum offload (like was done for the 'ravb' driver by Simon
Horman); it has been only tested on the R8A7740 and R8A77980 SoCs, the other
SoCs should just work (according to their manuals)...

[1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
[2/7] sh_eth: RX checksum offload support
[3/7] sh_eth: offload RX checksum on R7S72100
[4/7] sh_eth: offload RX checksum on R8A7740
[5/7] sh_eth: offload RX checksum on R8A77980
[6/7] sh_eth: offload RX checksum on SH7734
[7/7] sh_eth: offload RX checksum on SH7763

MBR, Sergei
