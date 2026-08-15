Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C2041CB5A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2026 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786819232; cv=none; b=WSNFcSOl7zXU209Y0AysNbqQNYZuF+0GVQBeGL59QqYFu8Z+ocLC4ceQrPhZREchRL/GgMI7jZEsmlRZg2ojY6S6UIK6OZzYSrNoGtnbF5gTRrp5MepIgAFNiB5MHPlUSugZy30ge9mqpkAQtCuj8f9NdwDB8kQql9PZZwxDGP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786819232; c=relaxed/simple;
	bh=/ZA1Q8Gwy+uG1UkvNRPO7Wo07xyRJMuxf+VXQgnmgcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ym9AzFUG0QaRNLpRStLQkX1j6QzJDnWpwQDoa/Z2n5pBdDaAEdC4TA3Eo0RjbWPZXSrOnVEqs5M07Yb9kyp0RQQTIrbPj3lLkG0qII58LtyGHFuU3QhwlYiJ1GitAfYsXKyST/JnMibOso0gvWFTIUBfn4qQY7Lvnwt2VTyLkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5PRZVQn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5PRZVQn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso2881765a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2026 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786819229; x=1787424029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4u+82k9vbpFdPR/3zT94ZUUXyCAtcrN9YltYPZ+Ra4=;
        b=l5PRZVQnFCK7yIbLWYne+Ar4vHWyYDwUeYpUVmopEpS68GdqmGnchUeX0R8zwWT+67
         /kcMW8mGnGTWMz58Q7Weq24iZRGytMPJRUHwrIHipi7WLw/+aYdEiIO+pDHVXCuh2NUA
         6ruSrkdsSY++lh3f33QnSQBzhxtlkYHLJubBezW3/zpw/hY5izu4tInlm2sZdLzjQOiQ
         YsMsdeH3fWGbLJZsbB1t8dnsBCIOqjoNcBVRhgrEn1Nmu6SasW9LlB7ntzxd18N5r3EK
         xJRfXyWL72cCpaaUHE9VWWnk7cv3W5If+M2CkLOdPpY/LclVbbv/P5iVotLyceBY8nK5
         dzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786819229; x=1787424029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4u+82k9vbpFdPR/3zT94ZUUXyCAtcrN9YltYPZ+Ra4=;
        b=ffbDkYbXohwSp9Ogk6lgoutObbCF3NeCxDpvM6IY8IzTBbX2tpdh5XEXM3rC81tXO+
         3UtsKbyj5lx6KNVlhsuUPfNXCPwR9SgdI+AcePpi/GsBlfmKlbc3DdmHDypEFx1BtDfI
         xdIKNZfB8MpQYLL688Q4uUr4verhE5oUGC73yOEGqVBOElsoS8j72F+eicaNozbfIfZF
         QCEzUDFfvIIE+f5Mu1Ebqs4JttKQWFckk0vXRHCiBqmU03ddKuIvP/OtmsgJo6ILDl9S
         XQRlF7wHfLMFGoLVk0YSFVF6QLX7bWXPqVOEF7+nXGNxCO7NhZva7uEbrc/mdt6jXQCS
         hcDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqA6QjbzKraOFvbxs44rIB5f3dZBs8wBq1+ueqXZ7Ve4mdNcnGrVrZBuh/fTRO9HYfkfzlF2JYff7YojxMgGau1PA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5H3a08f4FzF7waNDbQvcXSTWeyWj0fG7Lfx3NUu1Y24Y7CaZW
	0uGB+OGV7FfRVJfmUJh0/u85bbYYCl9DC4KQfx+fyxEZM+GOv3UV6ruL
X-Gm-Gg: AR+sD13a/dk+wYkpGExhDlC4SZ2m5GIYtEHSXRaY1WMP1pFVKYIxbdzwLWlIoUMc++2
	bRBdlitkv/evQLZccpApEENe7P3CyF7qd3udyfd/Mh3TugXPxQoZjIBi2Hk/Qq7G63mEuY4gWEx
	J0Hxn9vUoYD71P45bLh/PsFLksH9FM5M5ZN4dOiQF16s3bYwcI86LCrqSR2IbJ6C9lNWeFDKlRh
	dwX8WJTx66YljTJ6VtYGbcRR0CY/FVOQYcqTqXLrQgEI12LvfSuWQ9CZ6voqONyGP2/CGVHG3fb
	0/MajL2CFxbYCMsegfebk+5VnshoCLfA1tFY7/yGENO4SkDWmG7T0yIvqSmFOD+H4uMQSc2oL22
	ZXSEQELQ9PRmVv1W9py+9Qd6zFRwcvMDG9HcWYQI8d/37zruwweJJPK6HWcnxbcJ6yW0H0zl7zQ
	xkz7J0bmvLWP+sf7/YLfMZA4Ww0WrJOPgQhhu8ipVrkC4dtf7kQchZY0dWjID6dginEXFKSN4fe
	JylsoveHRj3N2TUyGLZMYHmtN36y/VXOJ8tr4suYA==
X-Received: by 2002:a17:907:a64b:b0:c16:9043:7973 with SMTP id a640c23a62f3a-c2129c1be2emr652620666b.4.1786819229276;
        Sat, 15 Aug 2026 11:40:29 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89? ([2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234b3feesm268117266b.14.2026.08.15.11.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 11:40:27 -0700 (PDT)
Message-ID: <f5bb5c11-c525-4eee-bd9c-8566d4c04ce7@gmail.com>
Date: Sat, 15 Aug 2026 21:40:25 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 05/10] net: ethernet: ravb: Propagate error
 from ptp_clock_register()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260811160200.2049987-1-niklas.soderlund+renesas@ragnatech.se>
 <20260811160200.2049987-6-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260811160200.2049987-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 7:01 PM, Niklas Söderlund wrote:

> If the PTP clock registration failed the error is silently ignored.
> Before reworking all callers of ravb_ptp_init() handle and propagate the
> error so it can be used.
> 
> Link: https://sashiko.dev/#/patchset/20260610102432.3538432-2-niklas.soderlund+renesas@ragnatech.se?part=1
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey

