Return-Path: <SRS0=Rjom=QD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2010C282CA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:33:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 817EF20881
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:33:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="FadV31Pl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfA0Rdr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 27 Jan 2019 12:33:47 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:37933 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfA0Rdr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Jan 2019 12:33:47 -0500
Received: by mail-lf1-f54.google.com with SMTP id a8so10189299lfk.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Jan 2019 09:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=yE1qOoOQEhglPvicWfa8996p8pD2c3a2E+EBI3n1ZVg=;
        b=FadV31Pl7gJth1FnH/xAU/v+YXTdRGscBCyzKumAilGKyo7eDHUIi5b8Oom2uiu2eG
         bLt0vVy7ulBL4Nl6DebadKchHdo6XNDpfgCE+og2RJHS/lZ6sxSNbBXkkNjgketN5UfD
         ux2gY72hQY9f3vccVUXrB18PQkc/lp7mjU+vEu05W2WuiSgnK4/5FTiZCIofzirUEvVn
         LgADexVRgD2+p6T9vsJ0Ul5OyQNOnHLxAXTVvejYojzC3pMWOKhlnJIPLNexb2aiYkE6
         ZkzArrD+/D7znBIYLQVvzHW7ntkuAQ/8oCBnzJzbCx2gsL+Zy10Vbfc/LkNv5GYolY8b
         I8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=yE1qOoOQEhglPvicWfa8996p8pD2c3a2E+EBI3n1ZVg=;
        b=O/Q01FnfD9mfOWx20FLsA6A4D8z9E+CJgA+quYha76ulj0FEKRE3msjeHguOrBWI4k
         7CyB3X8XiYlwGvKnSh6UJ56d8lf8f4CZIM/Ffao+HKX6l9+o9ctyALHnWd5F+polpDbM
         t+wkn2t3O5crwQ3ZGPmbFfX7+fWSUnOho4f/ti607f6UBaoqMztBSJhoZAc8t+xOqrIj
         9gsgWXlsyPSGZKsT+RqdY+HLfAiMK5mNAT820gM2Jfm8jYW6S14zL/NsIezxz6aNslAj
         fjAvRa+cDnveVPkZrvE36pHI7PZUOerwF86VE3IMI7IFZhHSXevWJ3AiAT37m6CaCSZm
         QNTQ==
X-Gm-Message-State: AJcUukdBnxgoBsZEEEcZ+rOoKmHs8bR3I4StXBHswLy0mGvqWhlDf3W1
        vbpkHoJh+qrP8SaxFvdfTdgnsMNZKYo=
X-Google-Smtp-Source: ALg8bN7MPMlWgHodQEIPKWAvEnmoZXJJnDchfPM4czcZARfkLds/K8cN9Zyr1OEHSh1nXyHTiFaOiA==
X-Received: by 2002:a19:c345:: with SMTP id t66mr11801353lff.55.1548610425652;
        Sun, 27 Jan 2019 09:33:45 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.150])
        by smtp.gmail.com with ESMTPSA id b128sm2580248lfe.91.2019.01.27.09.33.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 09:33:45 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/7] sh_eth: implement simple RX checksum offload
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Date:   Sun, 27 Jan 2019 20:33:43 +0300
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
Horman); it was only tested on the R8A77980 SoC, the other SoCs should just
work (according to their manuals)...

[1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
[2/7] sh_eth: RX checksum offload support
[3/7] sh_eth: offload RX checksum on R7S72100
[4/7] sh_eth: offload RX checksum on R8A7740
[5/7] sh_eth: offload RX checksum on R8A77980
[6/7] sh_eth: offload RX checksum on SH7734
[7/7] sh_eth: offload RX checksum on SH7763

MBR, Sergei
