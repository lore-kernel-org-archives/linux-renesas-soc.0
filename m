Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F343C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1257420684
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="RmAzh8/p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbfCFNK0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 08:10:26 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:47044 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfCFNK0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 08:10:26 -0500
Received: by mail-lj1-f193.google.com with SMTP id v16so10780081ljg.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2019 05:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dbvEi6vKeqM7rsL8tUw0vqAoDfWTetxS+73UGwJUOUE=;
        b=RmAzh8/pz9yglvDVKV/yW+f2W12/4ptSY8tQVgrx9C5VmiLVIgBD/59MrWlzm066Fc
         pbkoG+6/1DJTwDzenmjYV2pk6vsvVkb071oRJJoRru+6VaW6RqmUzd2bc3QavEcwJDQE
         EvDcSfwoLjxPKwQ2dCbPFieyk7CfJksuL3eRbVpzy4jTIZsjKXGdPzv8qSUvFUESAWui
         z+C5EI6wIlyiIImZ0o3aBLDWolNbn/vZuCS4V41w6f0VUkYyswXJZf+WFzEpjA1RoR/F
         6lgxZpjIQ8PgNZNAovw+Imp3972Pk35MJc8WkxZ47VO9CgqZJ362cSiWCkxNWlYav/0I
         szcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dbvEi6vKeqM7rsL8tUw0vqAoDfWTetxS+73UGwJUOUE=;
        b=GVhCN08gK2zuWK2JiXYu7yL1aZ+cr3tAqWVYOhOiVUC3p2VoVVWBN2VMIVR88vd1R+
         r7wIL/2YAPZPWx/tBh4p6TzxBcfCLYetyhSiSgNf1Rb6wvnuxDkYFMRePP/L/v1lJpzA
         DsSRGty/4z9vq5jo5J5jlMqziH1Gx55dGlyVwQp9gUeGrn43nbxW5ZQ4LL046lnEB0lL
         m5Q/jXJFK3wz0nqIGKlV37qIk3FjCjRzs+hBh7NU2PS2vkbKKATslCaPFL6DGSmPAApY
         doNA2At1+afcBTWn3VCSmXCkVqpQ/va/ioLnABurN4UQEt1NJ9JKq7I2tgN0ghQnxZyU
         0dHg==
X-Gm-Message-State: APjAAAVPzzeHD6IzCK0klq2K9VUx7bfDLA0xhuEFXDIchSpWTFfi5v+o
        6PXTvki8J1UFSjL5aVRlqFOpbA==
X-Google-Smtp-Source: APXvYqwP3Yp4NiRzsTkDBOHibSIvpo13LDsyzPosL9IMEsyAUtDEjBJTogj5aOtXbrVjViPw2T0O+g==
X-Received: by 2002:a2e:934a:: with SMTP id m10mr2409348ljh.164.1551877824072;
        Wed, 06 Mar 2019 05:10:24 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id 5sm362804lje.18.2019.03.06.05.10.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2019 05:10:23 -0800 (PST)
Date:   Wed, 6 Mar 2019 14:10:23 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77990-ebisu: Fix adv7482 hexadecimal
 register address
Message-ID: <20190306131022.GA21288@bigcity.dyn.berto.se>
References: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
 <20190216235854.15244-2-niklas.soderlund+renesas@ragnatech.se>
 <959b482d-09a1-2ffc-1144-101348bb27d9@ideasonboard.com>
 <CAMuHMdXgPYkCi+pK9FsfsCuWtAL1Ly7d=Ty88+qGH7m7L67aOA@mail.gmail.com>
 <59664792-ce36-d068-077f-e6cd12dc549b@ideasonboard.com>
 <20190225100954.jvwbty52lgpcovrx@verge.net.au>
 <20190306114736.GA2750@bigcity.dyn.berto.se>
 <20190306130435.7bfqt5r7etshljxw@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190306130435.7bfqt5r7etshljxw@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2019-03-06 14:04:35 +0100, Simon Horman wrote:
> On Wed, Mar 06, 2019 at 12:47:36PM +0100, Niklas Söderlund wrote:
> > Hi Simon,
> > 
> > On 2019-02-25 11:09:54 +0100, Simon Horman wrote:
> > [snip]
> > > Thanks, applied with the subject prefix updated to
> > > 
> > > "arm64: dts: renesas: ebisu:"
> > 
> > You took patch 1/2 from this series but not 2/2. Was that intentional?
> 
> Thanks, that was an oversight. I now have 2/2 too.

Thanks!

-- 
Regards,
Niklas Söderlund
