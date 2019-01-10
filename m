Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513E9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 15:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12582206B7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 15:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="UPeCpW/6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfAJPwz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 10:52:55 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39929 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729390AbfAJPwz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 10:52:55 -0500
Received: by mail-lj1-f194.google.com with SMTP id t9-v6so10148869ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 07:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eeDVbz+fOFCgYKaR7TAKOvU7o8lrtZR1scFcEQLYXYY=;
        b=UPeCpW/6UJ01LuH4eN4pTQbrRUEMsp5lt1+evp0BFUJid+6DfTFT7j4l2AvrD+vT+l
         1Fhj2XTLRvcfEGRa5zyY3ShwrBdzH43j5iDN6Hd9UETA/1jp+Tn1fTdM/mN13+rpjrJC
         hJioHqfyuUY8EU91bsShVoipVmZjICDCLHgbvYW72sRBH43m+UMl6nhr1mCaaqR8V3bb
         yED6dduSSfhTnnN2ZcF0DYuhRHqUBk8WIsywDBe66EfR+MRJDrqFojmLgQnE/wtjhTpT
         Jl1t5c8etJC8FFAYfsBOBZr+rkc4KrLHj4L4jwAe55cshHPk4TnWjh/xGp5uUzhbEVuT
         Twvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eeDVbz+fOFCgYKaR7TAKOvU7o8lrtZR1scFcEQLYXYY=;
        b=k1wVjC+6FuLbm/+sADvc+Pr/Xx2EvzGzVD9HnSLC8zOuRlNbKiv+0aaB84pKSuG0p4
         sSMXMPRH6/7BSpy388Z9n5ClSR+6ReAFhp1RRpORwD0TaiMPOHv/htfXScPK+Ghe5vAj
         qBCzaR0GWND+FwZbrU0hjw0awWfzkB9gCqdhxwVWB0jKM1oQ/eALGKLkeyOUd5t1SaVn
         Eo4qqa1U0eCacK/83CC6g44OID2f50j2XuTYuxsiMxrdgfemd0UfOLN0DDcr35N+R8R+
         +du0qgaZy6Eon9QfVdoDzph3QdbAGiIGSfQHi7PTj6rFGBO3IC6iwdFJSgcE+elJKuGP
         eYrw==
X-Gm-Message-State: AJcUukdGEthroX7ts+pDDIleTuaCrtYYI2S0hDe/l54lnOK0NcwXpyej
        dqsiPOpQeydeMwjnU0mX3idpAr0YPJs=
X-Google-Smtp-Source: ALg8bN79He+dFJX5dgH+sWHk7dem4gvE44A/m0ey5jEJU75QfpzdXa4UVy7KuLrLuBSZxlm8Qd0vtw==
X-Received: by 2002:a2e:612:: with SMTP id 18-v6mr6096419ljg.125.1547135572694;
        Thu, 10 Jan 2019 07:52:52 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.92])
        by smtp.gmail.com with ESMTPSA id y24-v6sm15267282ljd.20.2019.01.10.07.52.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 07:52:51 -0800 (PST)
Subject: Re: [PATCH net] ravb: expand rx descriptor data to accommodate hw
 checksum
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190110140222.32740-1-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <3a5c3a17-a410-fba7-32eb-a3495c5378de@cogentembedded.com>
Date:   Thu, 10 Jan 2019 18:52:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190110140222.32740-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/10/2019 05:02 PM, Simon Horman wrote:

> EtherAVB may provide a checksum of packet data appended to packet data. In
> order to allow this checksum to be received by the host descriptor data
> needs to be enlarged by 2 bytes to accommodate the checksum.
> 
> In the case of MTU-sized packets without a VLAN tag the
> checksum were already accommodated by virtue of the space reserved for the
> VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
> packet data space provided by a descriptor leaving no space for the
> trailing checksum.

   Wait! The gen3 manual is rather clear about the auto-checksumming not working
right in the presence of the VLAN tag. Where do you check for that case?

> This was not detected by the driver which incorrectly used the last two
> bytes of packet data as the checksum and truncate the packet by two bytes.
> This resulted all such packets being dropped.
> 
> A work around is to disable rx checksum offload
>  # ethtool -K eth0 rx off
> 
> This patch resolves this problem by increasing the size available for
> packet data in rx descriptors by two bytes. It also introduces
> RAVB_CSUM_LEN to make things a little clearer than "2" sprinkled lightly
> over the driver.

   What about using sizeof(__sum16) instead? That type is declared in
<linux/types.h> and used in 'struct iphdr'...

> 
> Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board
> 
> Fixes: 4d86d3818627 ("ravb: RX checksum offload")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei

