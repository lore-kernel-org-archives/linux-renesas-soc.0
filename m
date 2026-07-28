Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460840D565
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237182; cv=none; b=IwrERudk79vABZRH9HRs2CDA1hd0B4twF1WgHS+ru+aV4DXt/aV9BjZe6gMfN6WTOjUZMgHp4wzQeo1ou/544eDLYLbGjyVynZRStfCv31ZhjJWBBifKbwdN1lVUbcqav11POk2YQ2a+0LOM24J8Q29XZdkDrdYqi1vqoA5cixs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237182; c=relaxed/simple;
	bh=FcJab1d4wKaGbN1K5L45zRsnPXHEzhNKKaHhvSMpD+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bKmFGc8y1CcGnmHuA657EQvVCVEN8RzZJmKSk+C0NWBebF3Tq6JwwpO58L0XwX3BNwhqNaae04t0wHg6K3GsNG/lMnzZJttD9mZAtm5h8uRSXvKh3xxNiRs1nYH58FNNq1DBMiwW6Pl9V6c+rEfH+EauO4bT5IMmusvpvDk3TsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzvTGV2U; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oPaH6jAI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzvTGV2U";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oPaH6jAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785237179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bGJ4Tg+9r3wkBe/ueTnI9a7CbdUxzDkZ4FWsmLQCGUg=;
	b=hzvTGV2U6OGUgr259YlAdNfR5WAVZ/SyNmOt115sQ5e6W7QdIzoNfLQPSxmG7ySwBHmLFm
	5b9G5vcMBWWPnYS1ezJhVhS0SuuV21MRReR+1vWauv2gZ7gkFrPRDM1EZaL0pNm9W2SshW
	lJKoOudLkxtgZB1U3zU/8cA1tnxRDOM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-K_5Aj4HXPpuLYr9Rkgx2kg-1; Tue, 28 Jul 2026 07:12:57 -0400
X-MC-Unique: K_5Aj4HXPpuLYr9Rkgx2kg-1
X-Mimecast-MFC-AGG-ID: K_5Aj4HXPpuLYr9Rkgx2kg_1785237176
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-473ac08a6a4so2885771f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jul 2026 04:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785237176; x=1785841976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGJ4Tg+9r3wkBe/ueTnI9a7CbdUxzDkZ4FWsmLQCGUg=;
        b=oPaH6jAIwNLNEtjenuiCD3nc/tZv3VsHe3ox0GHjmvj47cjy31RfdTg4qKuvf23ryi
         EYAU4ufqzJk5tRNbe4zk+PY7Id1uAcjwtS+DP34dJID0lFE45IKAOqk15BYp04UjSB/x
         mezhoOmDvpHK/eb37AyPcrZ17uWJn1blPYf1p1x70hT388jjiBuzrK5GzmtzvZncQ3vJ
         3FnEZ4UREK0YI1DNSiQusKZ1hDbNj2yHvvtdffdk5J9xbGmOcW4GHtb78p0fFe7MKQJF
         hlVJ7DBFxKO+IdvFXFL5uPJV0/9tWHS0XYODGvnyrZ9te5pRaMhTTH9q7LtFy0/fSnFv
         LC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785237176; x=1785841976;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bGJ4Tg+9r3wkBe/ueTnI9a7CbdUxzDkZ4FWsmLQCGUg=;
        b=WfUaJoNvWYhdHJCrVWKSzxMCFteGQDpDRAQZmZPAVebhYnIf0g/b7B9lwGLtnmVMa7
         NCe9pe2NQ6OxbGLGxqa1DZSs7HkuIfw0sdl1gTQpy6OPqSi/1qBa+Nvltsw9iEO6tJd4
         jCjvZmMYuf/V09dCaIvNtYAsEgG/QPXdYkfw7kNcqVpU4yawTBUd87L8YnUoV1JyMDxl
         ttYiZY1rFbUUR1bMLP7SOMw81E07KV81amCEu4/k0f0QyuG0RAlw+U3RW4COP+4L1LUZ
         ZD/MO71g3KoSm1lIJZnUMLF8z0ziDYrDRzbmcSDlvou8yhnObnHyJeMmTl9WXfgxEvbX
         S00g==
X-Forwarded-Encrypted: i=1; AHgh+Rr31Di8vGEdyyYABnzUcs+ql+xkTRjlUbqvTPrseYnB4fje+xbIU7VB0HVdi76xktE1bFIcFh7zjRk/S3J8DjAsZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqXHpLdTXCr3WIIxazcPzIghcm/p2zLjTyAG40mfQwsR8VLQq
	NzxM6on9tKSoUv3Lvsb7cY+jIqaPttpTYPzuHR5Ri7BFiINkZ0NLoH3vXmoB7XGo5eZ83DsuXmI
	4ZAbFp6Rxg2sNiYrvwfmASIxBO8btdTRbPFACly77A/MDfHlnXN3l5Y3BogeMbiFEn1s+ud21
X-Gm-Gg: AR+sD11bmTCcckQMDunHR2boFkqTVOqFC3hof80pFad3iAC9YT1gC64TYDgJA87vPiy
	wYahBZXPyX+O042OI9b+PDmj4a0o3162OVcf1zUNJo/Pla+wNJ83EdM0kZiHnhw5RDV4laa2KLk
	5UigKPM/Njq0ZafexGnnv+m7Dk1aqIVp19fMRu66ZheYUz56pOstISJmrDv547nRg7QFlE6hBRj
	n1SfE4JMhKKtsZM+YJct3/bMHKhv7C5toTVulaxPw+O0oFpfbTrmb0ghCEVwUfrtqnViJUgoiYZ
	6D4O7+ZByzo/sNMK2huuBnnjcUJSJsDZrb7AMojfTJ3fNVoqOqZ8dSKdnBcNwa8PrOPVSj5DrdI
	Qgoohg+Eryt1HAWKTQwx+UDD0VkBw1NUA566B1UN62Xwp/CzI6HXLQosshH7+nptg1KZkB3DC4s
	UMqw==
X-Received: by 2002:a05:6000:2884:b0:47f:48d4:3f0a with SMTP id ffacd0b85a97d-47fb1edbff5mr2084128f8f.45.1785237176405;
        Tue, 28 Jul 2026 04:12:56 -0700 (PDT)
X-Received: by 2002:a05:6000:2884:b0:47f:48d4:3f0a with SMTP id ffacd0b85a97d-47fb1edbff5mr2084084f8f.45.1785237175988;
        Tue, 28 Jul 2026 04:12:55 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5a46sm56864881f8f.9.2026.07.28.04.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 04:12:55 -0700 (PDT)
Message-ID: <1f22ab9b-7951-478e-9271-3d659e991ea5@redhat.com>
Date: Tue, 28 Jul 2026 13:12:53 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260721132936.1331318-1-niklas.soderlund+renesas@ragnatech.se>
 <20260721132936.1331318-4-niklas.soderlund+renesas@ragnatech.se>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260721132936.1331318-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/21/26 3:29 PM, Niklas Söderlund wrote:
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
This deserves an explicit ack from Geert, I think.

/P

