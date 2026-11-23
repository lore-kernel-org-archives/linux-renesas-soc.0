Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428033;
	b=1we9BJvVY/LwHcd7+bl/q0Ah4sBwfS7p2ojj84PjAGHDnFdVN2QkT5yDugl8Eas7VVQb
	 iBilr6YMVvjTq70YD6a645nDcrA2uQb2QvXeaNUh4Fy7h6rICDafXyE0qDO7G1bkEGtOX
	 c0/K4UW9xOLOsp4G6eUSHKDmVsvv4PfYZ/NhxXxGTqL0u3SQXGJ4qn1UAkbmKG8CRuBbe
	 rnDwfrdCq0HRH4QgMDqNSx/SfVgEpl3HAj8UtyBugUqwGc6wpF2AhONY35m4vI+fPlDbV
	 kYtCrw5DX1tGi5/F4q7BwjYOOuEM+8FwsR3Xip9iAFGcTP4TcfhRg9apCjWq3cacb5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
	b=l4hUoyNLMRbDpQiMSVoA3P0LixoeRgs/+n5OkLh9oML3or+UREGjK8FRlGMGJMwKimrz
	 3oeozYARzkZMlJz0IKANyOH5zQ99crii2UQvlEzmBl51KVGJWUTFd7JLGMbXIRvpPYXvr
	 R7pBdbSzG+uuoxxS6GJNK5AyyRKb91La6+4KjlRrsjvvEJjUNOpSQi06utW+MWicboMbi
	 xBbSUtQk4kava/M2+qpBXq48UrmSwrTP3Qb4nb/gDRyPNgBxS3957eD3yfnaK3QzWOvzt
	 YmN6MxQaTC6p77+OdV7vFpIvS2P5dSOEfg9Wxi2CuHtgkV5uGA3q1nW8j+qjDPXn/jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=T+WOyYce;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C5606A331
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 10:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9C5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=T+WOyYce
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso20733651fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 02:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795428031; x=1796032831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
        b=T+WOyYceTAVbFlKECWT6WhONtRWVbafedKvFNN5EVsU19bdSBMmz1TLlii4nzDlrmE
         FoXvTiD4ZC6w1MC+mR8s1lwnzh9+ch96qkXZ5crHLMwdX/TrcHcWSH1IKMHbzd1x/+6F
         bXMOZS9bjkwE9knSNyffUMCeaZYte7F3GHuF6DdXnnrKw50mzxsUR9KMSsR3xHyPaKkt
         Xt1eHCfYpAP47AAR5tptR3WbXXWh3silLdfMPpfX4pUPawaXmWdXxG6uYX4EEASVn++/
         NhurnIgfMb1MwJd8vB1fbTwJey0V0CCWf4BrOg3MsEKL1gZ+9Qr1+XZytChByQZtdhK7
         +QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428031; x=1796032831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
        b=wvFuSy4VHciqSK8S6xsLfEg9zPRgP8diKOWagitHlaZAG342dzDYFyQVHHYxzZ3B57
         5AzUYKArY+rqHJvI6pyHP11L8AT9htwYj21xNKRva6nB5aGmmDNNyrFHUrXC1QqX17lH
         VddNaJOeij3kQO+4OPSVXLCCT7DPXs38h6+jByQWczh22LY2Qcpy6d+KCrK4AvkRyrTp
         Ab6C/RIh92sUBg+Qdf4asj3Fk+si9cNA4S/+MXrkLO267BhCQLxdaSEcgm85lcKezZKL
         JxCE939AR7uvjFtPQRh5z0trr1MHJHtkhLkmwyqTxqKOtLfJt6YO6WsJSPxsECUGgKfF
         RVeA==
X-Gm-Message-State: APuU4Z9G+c+3vyACwlA9pSc21VY/PrUXVvGP/3eCJ06ePB6v0wn8FmiF
	JqQjmwwraxM4ohCGbYY58Uddl0t5IEmilE/wnz7iFFpdy4yx4hC+J2drYA9Z/yBArW4=
X-Gm-Gg: AZFdTZd6Pe3hUQxgkQ0EYGqc9Tpx6PZV5yTVTyAZHXereRKa6Sk0RO0QoNeyJUl4QZ6
	Vi+4NKi0SIrkCPeH44dAGRHgxl+F1tIMjrQe6bq2Rae6x9Ua5pOou/bI99n8Rz1J8H4PRxohqmk
	hMeAtFeZcgqhPZD2o4nZS+4pk5VCFiOVaw6TSs1NfJDnZW4RntWtFFYRKdwCkKcNhrZ6VXXwfcY
	AEtqQcfPmkEhELz2E13AJ2GbDBaMG7hya2dy5V6IWkleol1DjN8zkNnza30zYi6ElN3pzenxFnw
	TLY/RcBA+wLNzuwHhhCIrycCbS41fyNjfwG7MyS9q69ZdbjTBLS2UZ3yPcZyGjUlTUKQWzu9WdL
	0lDhZDffsgNkwo+dnZ/UlHXPxWwi51rqJtGJn1dHlRxP/IBbDrvVEgfSKBQxM+1VanAc4eBqWaf
	xL/SxikA8F0vay83LKlL7hRS7ukGLlbtsvMcOO6iynyW5g5DLcesMiycmtr9Xm6mzEGh3p7LXNk
	HNTIk9cQkms7WEqJBn03bOia7OxTQRAlo0Sg03F+4nea+yTd3PESJ2ciAyUbmeFyUrJ2fxP+FvR
	509wbxSzeU2HQL9hYT2QDzujj6YkwUjUuActH4o=
X-Received: by 2002:a2e:a886:0:b0:3a9:79d6:c792 with SMTP id 38308e7fff4ca-3ae7f9a0f16mr31993241fa.5.1795428031182;
        Mon, 23 Nov 2026 02:00:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8052992esm31044491fa.24.2026.11.23.02.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:00:30 -0800 (PST)
Message-ID: <d1fbf535-62e3-49af-8eea-eaa5649f8977@tuxon.dev>
Date: Mon, 23 Nov 2026 12:00:27 +0200
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
 "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
 <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
 <TYYPR01MB6603558B6F19CAC31748204486452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYYPR01MB6603558B6F19CAC31748204486452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 11/23/26 11:46, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: 23 November 2026 08:07
>> Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and critical resets for
>> s2idle
>>
>> Hi, Geert,
>>
>> Gentle ping.
>>
>> Thank you,
>> Claudiu
>>
>> On 10/19/26 15:25, Claudiu Beznea wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> When the system suspends to s2idle, any of the IP blocks may be in the
>>> wakeup path. For a device in the wakeup path, the generic PM domain
>>> (genpd) does not disable/enable its clocks across suspend/resume.
>>> Re-initializing the MSTOP bits for such a device leads to synchronous
>>> aborts when its registers are accessed for the first time after resume.
>>>
>>> In a suspend mode that is not controlled by firmware, power to the SoC
>>> is not lost, so the MSTOP and critical reset state is retained and
>>> does not need re-initialization in the first place. Skip it when
>>> pm_suspend_via_firmware() reports such a mode.
> 
> 
> Looks like a bug in clk driver. MSTOP is controlled by clk reference count.
> If clk ref count is 0, then MSTOP turned off.

Have you read the patch description? Here it is:

When the system suspends to s2idle, any of the IP blocks may be in the
wakeup path. For a device in the wakeup path, the generic PM domain (genpd)
does not disable/enable its clocks across suspend/resume. Re-initializing
the MSTOP bits for such a device leads to synchronous aborts when its
registers are accessed for the first time after resume.

> 
> Suspend to idle. Critical clk is on, so there is no way critical clk ref count is 0
> and corresponding MSTOP is always in stand by state.

Didn't we already had this discussion here: 
https://lore.kernel.org/all/TY3PR01MB113460224F0225E29A7C5097C86982@TY3PR01MB11346.jpnprd01.prod.outlook.com/ 
?

Thank you,
Claudiu
