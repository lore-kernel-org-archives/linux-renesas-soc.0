Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C055DC282C5
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F91520870
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ZZaZzs3l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbfAWPCD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 10:02:03 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:47004 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfAWPCC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 10:02:02 -0500
Received: by mail-lf1-f68.google.com with SMTP id f5so1776033lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jan 2019 07:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/yLmq2n5DKJMWdj6suREw8eiKjUzl/P3EPHowaxkJls=;
        b=ZZaZzs3l+DA3ZtsMkJzcxYiz7RuHAcs9r6hBTG7A3QXP56xGksykh4ZTY1BsgMd0h5
         mbMy/Ae/9zBV/DNGNxDZmUmYxVUgwSoDavYVUxcDISalCadIRgNIF3NFDAYOcKi2aSZg
         e9f14o5Y8RyGSqQJu26iCuF6ItRmkXRQSMbvhSevToiR62FsB4gzCZBh081+q6kIjlIF
         7TMv+pSirkxX0Sw3YRo8AJpJ7YF7+0/xTsosJCKmo1/Ik+bbNCiFjsu6jkkceReaTAWA
         LxBCopIOZKlBEXBkd4/Yb9hjoD7zgcQbV/6ZoC/FWomua69jsDBnXr0aoXckKdUS+inC
         bh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/yLmq2n5DKJMWdj6suREw8eiKjUzl/P3EPHowaxkJls=;
        b=MHMQ4MsHJvN5mgbzltqfskdUBx4D2qYgRQ4bWF/X3fgpv/6gah9geuUh//NYWn4Pg+
         dZrb7unub6U2X0qcQNdspseUO0pRzoqdeI8FTdLqXAHq+e3bmwda0t2q9IoaNOs0Wow1
         j77SiS0PX5YKT2CMa80KvkeQyC+SsNcuX0QE0a6ZF4Udjoptwbff+uHJPmKIzN6Zsu1i
         9wcua7yuNWBWoofhbjH8y/VbdFm7e6RoJ39MLNOufqIVMcqAVNhYvNxTYB217FZDj/g6
         vqZCjsatMk/oPHZfuZ+MCn0NRc48BWiqTNFP3ir29wDke92VmIdAIlwHY0IOrLNaPBFt
         U22Q==
X-Gm-Message-State: AJcUukcss9VRppwJXb5hf+Dy9tdSis7OYugzhb6yxyzXa2esHs1dQrsH
        DPaLihLs88CtstiHAJfd/zZZvQAeRBk=
X-Google-Smtp-Source: ALg8bN7xKZ4bs0jTH/9RDgtWWeV5tRKBeEYXDHNDHASmaIBZyuwwI7m1ihWiBB7wNEYvMwDaFQq6rw==
X-Received: by 2002:a19:5a05:: with SMTP id o5mr2290180lfb.140.1548255719516;
        Wed, 23 Jan 2019 07:01:59 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.180])
        by smtp.gmail.com with ESMTPSA id y23-v6sm543577ljk.95.2019.01.23.07.01.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jan 2019 07:01:58 -0800 (PST)
Subject: Re: [PATCH v2 net] ravb: expand rx descriptor data to accommodate hw
 checksum
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190123111452.27845-1-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <a206de4d-60bb-e2d8-9bf6-65b081effb62@cogentembedded.com>
Date:   Wed, 23 Jan 2019 18:01:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190123111452.27845-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/23/2019 02:14 PM, Simon Horman wrote:

> EtherAVB may provide a checksum of packet data appended to packet data. In
> order to allow this checksum to be received by the host descriptor data
> needs to be enlarged by 2 bytes to accommodate the checksum.
> 
> In the case of MTU-sized packets without a VLAN tag the
> checksum were already accommodated by virtue of the space reserved for the
> VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
> packet data space provided by a descriptor leaving no space for the
> trailing checksum.
> 
> This was not detected by the driver which incorrectly used the last two
> bytes of packet data as the checksum and truncate the packet by two bytes.
> This resulted all such packets being dropped.
> 
> A work around is to disable RX checksum offload
>  # ethtool -K eth0 rx off
> 
> This patch resolves this problem by increasing the size available for
> packet data in RX descriptors by two bytes.
> 
> Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board
> 
> v2
> * Use sizeof(__sum16) directly rather than adding a driver-local
>   #define for the size of the checksum provided by the hw (2 bytes).
> 
> Fixes: 4d86d3818627 ("ravb: RX checksum offload")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
