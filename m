Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320245;
	b=YRbFBIsKkQ50dvvP3DcEJxUSNlVidKFRFIQUu2o2J0TpfIJyhcQOhDOwgXfuVgZCCv7D
	 ntCRNMebtzyK04rfXmbzj6F28NFhnIHYnaiVw+ROQIy0wSDeRhUD1QJOGrqg89gvwrMVU
	 9M7kJGLWj6lEWIFK+O5AxZ751l+7FVPvuX/+t2TCGzJRjixqK2PuzENDQRyCSdbviGmp5
	 6vk/RBXwhwTj2xbRCDo0ki46H7jx1dtoWBhuOQmqjw4Q7lJAS7pKCQa6u2+7EQxsk/bFE
	 EMyettPcQfOg4hrBuHAckd3RimmkyHIY8KJSWnhndOZWpUbN56Xjr8F6/f5TjtR4nRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320245;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1sO8TShiJNFb0KYXxNfr4n78remHhHZjTgn2fa5N6SM=;
	b=ZVSqLOH8xcgafAtyR/p2l6LceJogTRn7raCxpz/GGqj6g5DjwSUwpAnTCn3EzKPmRjlo
	 m9gXecIqg3Mc/kyOgpr6fqqTpQxVqyiBOtsxmkXnmwbXNvXhS7OvyeGxWPQVrjuedGktp
	 xtmvoryANZziTOqOO3Vv8iWOUSLtT6Q/oWtZZxPoW7b+j9mqEgqELHCQFbBn8JOPyykz0
	 fBLidO1JrdFZZdliPf/nAyNI+G04Y56EajNQnEEm+2u7XzPh8Q47CdWOYeEAHbwY5RaKA
	 Cq9sKJZXYJhrMe34qrRzg/Gc1ubLi2ZnMBM2uuJYrLVaoANGDAQmVUbyjlY/cBluqIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB760A2618
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 14:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CBB760A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so59196366b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 06:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320244; x=1794925044;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1sO8TShiJNFb0KYXxNfr4n78remHhHZjTgn2fa5N6SM=;
        b=RsxnO04BVy9OaZ3j2APcNh5VnQcJbdz9ruRWNRAxL7RayF5Cn+vCBynrJSGeJlttrU
         L8NJI/2GKbT3zQkBLon2Yr6j1QICGQQ2HTiX9KNx0BdgrG2h0C+QJQqVo0LOi32bOudG
         R4mvJPwXbVfmLeo8mrq8ggUn9uksAKvHLsr2bs6JBcvoF6Tsms5UsWgQBmplhTzj5xjH
         ZN+EWZCGKTL19pryGiIZvFQjWf8hR3KUZFWXlSbg09SepUGXUGzXVRK4JugBbAuDFyRC
         TeifcESmDSPbVhUAkP5PjZDrLM3kCgi0wQvVej//YD7/V/PppZVXGiJu3mzkaSWDOzVn
         YpvQ==
X-Forwarded-Encrypted: i=1; AL+hErHpxpf4O00w7vb010LWcIXeQS1zDWd+Pu5NsRrkx47PccYDYTKjhy0/Z9D+/MQZPWuADuSMA4sFzCh5pl9BtaGHOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HwZRB6QYYWtfEl8Fa1tHPGdmtC5Wz64926UmzyZxvWKLE1NaY
	Xuto5orcguzX9ITMeiNFztu8SpgJlVF+2EsmYHloOEzMNqi5lM3PIEvISZ90YlMx6Qc=
X-Gm-Gg: AYBFou1WC4gKmkV9QuIYcxoTG+Ge+B7aKd8R8ZC6+AKLgVJGdO5l56YOlSwx/HVzssz
	NcuDDc+Al51plZj2Vhy3c6DOI+eq11tLsVt3S9AJsIb9xTVcVFDPyte5V0rJlFmJpX4qCryvVTe
	qBhzf9OmEs7ypkf1IUAWqBlkLpqwYnqMHQlIU1Ib1QzHyv0vXfqSHw5h/S2V9hUqbVHOVDAsBog
	nJpYGYxBYFUdUQaKwacw6asLmR8WXIN9By/jR1ThTmWoY/V698mAiTiybu8Vym1VyLqlbFl9LOx
	fx1dold3SXCioZIkxznVy3lBqY6ccq/ZVGBnnbjIq3k3wfa97hl0ZaSI5NyVSDT201okHVbNcWM
	6ZMQEQzXrhF6GJot/DrQPPD8O9Hw1O/jcG84iLTou3uKh0tuBMsuJIb+vXVZ5Blo41M5VSEajo1
	guyhxOU0YMfuJHtI/aU/7AGahA5IB5PUG13gTbHEI1Y5Oz2Z4USuaW8iC8oFIzSaoQmhySCPqrj
	TagyRyj6eK2P6Ij6crQtBxTOor7ALp1afYpUuGS6sGQJRg4QDwZSWZqWy4/jjvCPgYcerNk4uCv
	DM6gj2EglaVTD7DB3XPzMT2jgfhvo5A7++2DT5SdXwYWOK4DFDJBOiN7sMvGctK2L28=
X-Received: by 2002:a17:907:c13:b0:c49:9632:9280 with SMTP id a640c23a62f3a-c5049713306mr270745066b.46.1794320243452;
        Tue, 10 Nov 2026 06:17:23 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a62b303sm110659866b.58.2026.11.10.06.17.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:17:22 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2424670a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 06:17:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFIuAYFpVq0GB4KTmnqA+g/Dw7xtVgO39juaTfY1V1tfro1XXw17aKkkQhM0ghGAL84BIKPHh+NBoNvQKq4YawHpw==@vger.kernel.org
X-Received: by 2002:a05:6402:43cd:b0:6b5:7140:e2f9 with SMTP id
 4fb4d7f45d1cf-6b756af3757mr2247392a12.33.1794320239029; Tue, 10 Nov 2026
 06:17:19 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026063942.3173469-1-den@valinux.co.jp>
In-Reply-To: <20261026063942.3173469-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 15:17:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXoxM-e0i=WTz3pgugmrxWb=BHfkCvsbWORvNO6eQTVzg@mail.gmail.com>
X-Gm-Features: AclHuK-Nj7_0nF4taJQudffw83bvsSL8D-xjCW71vcQzgkfQMu5qEkMjXoji9MU
Message-ID: <CAMuHMdXoxM-e0i=WTz3pgugmrxWb=BHfkCvsbWORvNO6eQTVzg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
To: Koichiro Den <den@valinux.co.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 07:39, Koichiro Den <den@valinux.co.jp> wrote:
> PCIe channel 0 on the R-Car S4-8 Spider board can work either as a Root
> Complex (the default) or as an Endpoint. Add an overlay that disables
> the RC node and enables the EP node, to let it work in EP mode.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - Polish the header (Marek)
>   - Link to v1: https://lore.kernel.org/r/20261022082113.3163666-1-den@valinux.co.jp/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
