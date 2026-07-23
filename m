Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5E1343D72
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827084; cv=none; b=Vhu4JCHUhRCUnbIjJr5Nz0IxBiXdwDfwA5Wd4s58HeriI4jLyEXKpX6KXx+zNJit9Mox+zikKo8tTV4H5suqjTNQAtqN1rFtwNsAyaj8HfZy1mUWBwdLz1RbZgid97CXSFQ5Dsd2m/KNft9dQDFE4nTASRYZ9jQltU2W2ixZ044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827084; c=relaxed/simple;
	bh=U4PV+otM4HvmPoIAswkhykOdXBL/F+RWVIZT2ICHNqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+XJdLi0mQTHXJU2q0MX0/B6RFenJ1N+IMfZAuachikGHJsbEP63DcVBct4YwUUdKvEV25y+Z1e8YzaaGK59l5SzxOKY2okXjN0f96v2kNxEEpCIuMP9PRpZZ/kU1ebCiCsFPI8qIgBb6kJkf9Khhz+JwcQoXFsFM7lnRi/+QSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=B+CCtyzT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="B+CCtyzT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954d29264cso4859495e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1784827080; x=1785431880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3uCiBfCgYJ/GJUlVW3+aq71LQppa6fxRulw7M0zeMU=;
        b=B+CCtyzTOR0BMz8CAz/MErXqUKjN4UXdTIzsGgkyMe1iwcNG8/A1Kx8kD6nnVi9sp2
         xQ9Jiz8aI6TS5wH1xU1IRYZAOpxFPeyCplxUAbN3t6Zd0DPeswYAsc7Yue6y6qhh5Wch
         ELzoYetSu/ykpev4cw+hLgo1/javk1CBj5vFaCkSm2stfxOvpCwdJNjy0ZmOqFoDHiEi
         Yqj/4yJxTy5Pq6EyNwWP8WneRx+52vAma6ZbXvNAdWRzZ79dTX/uG5nRZ45IiSldoVS5
         O5SsfRQuHFWlRkBqeSypqNEgqS2qK79ZA+Lh4mlJu5YVKvOhvErT+G6Q8jvn+HMuO4pL
         AfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827080; x=1785431880;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3uCiBfCgYJ/GJUlVW3+aq71LQppa6fxRulw7M0zeMU=;
        b=CHIgUiBSrKTreld66stv+/M740lsm7vHKiaa3p4sMjE4BFCOewiEX6dFpihUThoqOf
         jsrWdcqEJMlTdyADlt+AWfPYyjQRqFX2+RvPwqLWp5lGcQNLq3vmhbjV/vzLKJ/OVLXo
         U9blwFuTqbVsCugQn3IzrQoCtyiLZrhkh17tPiAqfUXh1wswvxoOkKbuhGQ4solZNt6P
         iQexo+tqwBDkIBjDGVo+NUXtyBvyvhM3xInWGGppFksJKi4BMQ8EXEQqoetnEsbI00hS
         ycVTVeGfhuYId5/wQWtfIJOT+M5MZLbZP6Y5bEVIUqlZJ6a2sfN3kRpJGoDEKx/Y60RN
         jslg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5CvvPW8qgm2Vyk3pxnVkZaEqGUGK5fU5dcgNuZK/NPE0JHsFNAlnEJmYlbIUi9HSZqEPMLoWxSRlcq7i+t/7PSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLuUESAxpmpABmHkVH+xxoryYwhG3nqr8R7k2cYC0HRsfv9Lrc
	k3ado2VYEq+LGe/x0j4iPg8DnIA9oTLv2Lo3ndfz5qi7vnth5EjZPU4sA0lEUA6sW1Q=
X-Gm-Gg: AR+sD10M5RP+F2ru4UiTTSBSOgKAjFr9itsKbCRNzGxlYXprd2WZONQUwhsnKmS+S60
	PMCimTdk9ZPiw/fnUCwSf9bhG9bI8J5FI9jjKgbuhjztUymyAtN/sBdiNIqCJo60YfMOoQrHb7R
	8VlwaacdXIJaX51B/hV7HQqjROGTH2Ej0+i3N68OCk0I7r4ebtKcP8ijU1Vs9blVTa+C3+eDMhH
	WPNM6Spb0v8bIAKqVBVCJ9Xj4cApa9kPwK7qBUY1x/vAn9UoOpH7NSrQ5/zA2VoKCB6vjF/wRd0
	5wsFmUmqwmC7PWwSKl2ct28Ry9IZmoxpBnbjn3ttCLCH1JTQ2L8yb2bObRdZbfueXFkAysZAUlu
	n5yJAzW6HyzfjW0LVFdM4a+bOU7ql+qEh6hTxjkC8EAQEQDTYwowsm2OgoiZq5oKAPQR3HhR2lm
	2NUqUedAywIu1yWa30k5FK1ET9jM9bJQJsFBJwWi41D2vYKBrAttFp5hKdjw==
X-Received: by 2002:a05:600c:55d0:b0:493:b811:e549 with SMTP id 5b1f17b1804b1-49573cff4d8mr34111725e9.29.1784827080510;
        Thu, 23 Jul 2026 10:18:00 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6302:7700:4510:8c44:3b9e:61ae? ([2a02:2f04:6302:7700:4510:8c44:3b9e:61ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm16870489f8f.18.2026.07.23.10.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:17:59 -0700 (PDT)
Message-ID: <2869cdfe-0233-476e-805e-b026746b1eed@tuxon.dev>
Date: Thu, 23 Jul 2026 20:17:57 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI: rzg3s: Propagate platform_get_irq_byname()
 errors
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar
 <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 stable@vger.kernel.org
References: <20260715223019.3002237-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260715223019.3002237-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260715223019.3002237-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/16/26 01:30, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> platform_get_irq_byname() may return specific error codes such as
> -EPROBE_DEFER, but rzg3s_pcie_init_irqdomain() replaces all failures
> with -EINVAL.
> 
> This breaks probe deferral by preventing the driver core from retrying
> probe once the interrupt provider becomes available.
> 
> Propagate the original error code instead.
> 
> Fixes: 7ef502fb35b28 ("PCI: Add Renesas RZ/G3S host controller driver")
> Cc:stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
