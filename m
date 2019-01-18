Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FA5C43612
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 14:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AB4C20883
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 14:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="0oZ3AOVn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfARO6e (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 09:58:34 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:47014 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727578AbfARO6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 09:58:34 -0500
Received: by mail-lj1-f196.google.com with SMTP id v15-v6so11827436ljh.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jan 2019 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zwQk0/SUvuUsipGGnA3hOviWlmihrB0j4BcSOl8BPU4=;
        b=0oZ3AOVn+gCIIlNzMfl/7RXOIC1wFfMdQjnOhLu6Xrd2m1mOldZAm8M8PYBLjZqsJw
         F6+IcTSGtnf29pAiTS8slavjdufEWXc4E3tU1FEuETYmzBtKVw4zy6WNN6lPADdvt66e
         pK3SP3H29qOltUZnYYXC/1W0bkNAS59aTDOzlUH1w6Bs6sgNe8wnO02BWPQKcLZqMW5e
         NdcPNGbfWQZE29O1P3N6HhFDUkUOlwWK1EOcLWwtfSSnFdX+f1NRkdCt/cDXarm6CXfn
         z92KIWefaeA8mgjDvdnsVw7EjoSJ+ouxTeXT8aV/HUD5+YUtgeKBxF8eEtnksaBLD812
         6khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zwQk0/SUvuUsipGGnA3hOviWlmihrB0j4BcSOl8BPU4=;
        b=KglFc844K3wBO8IMlot5aG0QzuqpHFjIWNLW/zGH4p2c3pGsuhk9xkbBnTIcMrJHoA
         6Gi2xNOxhlhFPmov9UQldVJxI3jUbwwoE4z9qJcsEl91GDyRpIA0Pv90K+66ZKsE2nuO
         YFUj6f/e46fuTxmeuYGUeaijLtyawyLM2n778lkNzzYMGuLGjAx8vwxCu9WtClR4qqK1
         9JrLKi2nTUurGVNhqJxO9/EL3Ee36hanSYBWNyvJjMY2YwNeM9uZMH2peuMDlRK4cN3I
         tpqZp6a3UBegfEh2sdtTYJdbzsypraPrBa6Sv/KDKAwq4Ynj+b7LuZ+rP3dDJAa4YGSF
         SYbw==
X-Gm-Message-State: AJcUuke7yj686HtipuP0ge6yHki1Yr7cvLGM5d1lSSJiFeHwixiRstZo
        ksq0bKTpptmWU5O47uy5RnJ87FGqo4E=
X-Google-Smtp-Source: ALg8bN669xLcYhXvq4kMKlUdLjIqp8TadBmZ3K9XCp2i4DrI5ZdCe+EztKVdqTVFSvY9hDbu6vjlog==
X-Received: by 2002:a2e:9d8e:: with SMTP id c14-v6mr12250985ljj.146.1547823511330;
        Fri, 18 Jan 2019 06:58:31 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.87.207])
        by smtp.gmail.com with ESMTPSA id e19-v6sm781513ljf.67.2019.01.18.06.58.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 06:58:30 -0800 (PST)
Subject: Re: [PATCH net] ravb: expand rx descriptor data to accommodate hw
 checksum
To:     Simon Horman <horms@verge.net.au>
Cc:     David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190110140222.32740-1-horms+renesas@verge.net.au>
 <3a5c3a17-a410-fba7-32eb-a3495c5378de@cogentembedded.com>
 <20190111133502.dma5hft5wgowdg6l@verge.net.au>
 <c4b650e0-709b-d078-e094-41b652603906@cogentembedded.com>
 <20190111154843.k7pejayjrkwvj4pp@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <bc344c4a-6f4e-ca65-e7d2-977f91f2662c@cogentembedded.com>
Date:   Fri, 18 Jan 2019 17:58:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190111154843.k7pejayjrkwvj4pp@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/11/2019 06:48 PM, Simon Horman wrote:

>>>>> EtherAVB may provide a checksum of packet data appended to packet data. In
>>>>> order to allow this checksum to be received by the host descriptor data
>>>>> needs to be enlarged by 2 bytes to accommodate the checksum.
>>>>>
>>>>> In the case of MTU-sized packets without a VLAN tag the
>>>>> checksum were already accommodated by virtue of the space reserved for the
>>>>> VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
>>>>> packet data space provided by a descriptor leaving no space for the
>>>>> trailing checksum.
>>>>
>>>>    Wait! The gen3 manual is rather clear about the auto-checksumming not working
>>>> right in the presence of the VLAN tag. Where do you check for that case?
>>>
>>> In my testing on E3 this works correctly. Which portion of
>>> the manual are you referring to?
>>
>>    Section 50.4.1 in R-Car Series, 3rd Generation User’s Manual: Hardware, Rev 1.00,
>> section 45A.3.14.1 in R-Car Series, 2nd Generation User’s Manual: Hardware, Rev 2.00.
>>    The problem is that the checksum is always calculated starting at byte
>> 14, i.e.  amidst the VLAN header (if present).
> 
> Yes, I understand that. What I'm unclear on is why that is a problem.
> Empirically I have observed that RX csum offload works in the presence
> of a VLAN tag and offers a significant benefit in terms of reduced CPU
> utilisation.

   OK, after having looked a the networking code, I agree there shouldn't be issues
with VLAN packets.

[...]

MBR, Sergei
