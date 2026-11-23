Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448813;
	b=XbQW6ISN5p1BQjtm4aqZPV3wFKPUfgaPPUIs3qgJiqu4PNrLTLVZmcrZNFrx5b08W3fx
	 Fcrm44YR9O1VY2tEqsuPW8BOrY9K+7tOa2mK5JGBhtUCl4JTtAVkHzbbvMNXnGaV8KGV/
	 Ykfr+AatE3xRK7J3ON3t5Wx+zrSMxPD53c4VibKU2Z5kFczCTtvMC9PsuBlyPsxXQQaa+
	 DuoIh254pMvDNhqPS/h1EbBhTZ3dhXwwlwcNvosUVa0tdFE0IMo5azwt8Jewqqg/gzwix
	 3kuptIAD55yAcdx5kOZqiC2mMkgUx4kEnYLw1v2iZ3bHvnJMcLtCzZvnBuSbpfCKQeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=;
	b=UpHsPRuveGVEifmlG9VKK3/jsBnKc4vZYYEBdMawBEoKN8XESHA07Fyie5BeEkBam0MO
	 0nZPGJzF7A/mjJqx8l5CEKhoj0QESrJ2h7n/q6174HEHjxCcxFqICY4U4Mvj//SUHoa2b
	 Zdn/pniVcF4ShZtV6Ye5PeStIrgjSkSjk0YDMvgl40BaJSmZmksToVXGNTdZg00592g7C
	 DwkKSpHAY+ERD+FtkpQy+2GHAau4cI6XO+QQNl+IzBKAnuk/1itpi4s7LdkGu94UT2i09
	 O/7UU34a6S5FKwB/RYhfUWxfa4+vM5FMguimi2oqY/8q4jeARlxvlN6INVcsZY3we1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fOacZBda;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18127606A31A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 15:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18127606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fOacZBda
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19511305e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795448810; x=1796053610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=;
        b=fOacZBda84BFoSkxXuiBVPLK/rTm6IN+e9Ek3paclKzsb1oUy9+exLA1ADv7ZABA8u
         MR1nAkc8ZxaJ/NE0ubq28uS5lLu04ASAN1E81kIwboAxh6EjEAJa57Scn80l7VM9OWPD
         3GcOQ3H75clVIMWmk8NCvi6ucqRuF620LaP6pKF9QKb+98kPRfVBrEXzXt5KK3O4n7A1
         QznDfPcx3UK8HKVzDGk8rremjqB7GvcZ5W1R5HlnN404GpcH1NuKWwVPDhqHknlCM68L
         p6xI23V9vBPx9u7bWGiiiQBxtEpJDgNrSjUnB6a4pv658iUwdKWUpqcRTdQ+obyduqN6
         yhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448810; x=1796053610;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=;
        b=xGo4fAmvsq0W7YVkoqwdEKAcC3I7CYj2VGMYdFK7GF48HwJ5CgzfNLyXtTTqPDFcvY
         OyEf0RkZmwGfcomS4zCFZs4yO2uiYTKNROzfN86+tiQ/TKrhXtV/hmxpRBJBAu3LWGNW
         WddeRNY0EgvJHRrmLKMiWIBQrQWTmj+cTANsX9CYGLxIQTtm+njxrqKPo3Zv3aGj4JXu
         CcXNnJ94tdFC+l9PkhAUf0Sq5wUc9/gBxCWu1caCecHPI2qSgaduvGDwbBxHQDyP/NlK
         G9aWi2leryDt5fQK963CFlMaOnF9QDgax53KVYGwvkDU0u3MUzKF4X4R16r/QkhaNfXN
         +fxQ==
X-Forwarded-Encrypted: i=1; AL+hErGf/wh6Z6R/s/ltfjp9RBL8eTBjnCpQETyf8qM4hIq/o9lDw5ONGVmcs0GVkPON0tyRWmqVaAoNqsP9sSEFZVHnSQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uox52YdwY68OL33JkOeGgBI1e+XFjrpAkbYovISAMCvCedPLx
	7ceNmYAPDWgGUsYpgkfuPHdS7K8+psSnJv9U+G1rgqBJ6m6uJoKkv1a5DRhN/Cn62VU=
X-Gm-Gg: AZFdTZdHwLfMAKmwy/UG5l1GL6F4txo5Izn4VOwvF6m8hFnIR0Xih4/gJfSLt37C3mA
	1xCE5hmIc7x8pVGBE1xdVRL//3LcFfVLDyIzcvGtPp0bB6ma8YFuRGbb0PODF6BssBOtlKUYdgm
	B8ztY/SxN4+ye6G8K32LotxhHw77hK9u/2vnEBv2lW0Xq8lI0qBJa9DnB2LLvoQTr4pGBD/98wv
	A/TBa3oiN9oz0DeWokir5kv0i4eXSY/CZHvXJKmtMk94iSass22gSAmkomKKsqALnJ4ETRuvgNC
	czxfnxIboFYuGLgYJ4X18Ko3g9Ke2QINLJOCjnYIxlPYTD2R9UNMJsGHS4ukCUh0phSMUZzi/SY
	69gxcgHiN+zETZcrLGj+jy/zhv/ZH0mi7HuZOndNUe393mvGJQ7BEC3tKPm160QHgnuJWU0kPay
	KR+LdBbWHWx6dyiLYkrBnUX+GhmUUb5uGSIK5K0I+etbMW8EiJ2X48avqDn80dudk/NCYm1Fhrb
	eMkoAVHWPSTonCKxUvZMDbkkjzznySF87V7H2Ckw7SxO61s/sdpiNkREuU0sXi1cGRUtz8pUQo8
	2Wv9F9GRlxK3DnnjVZMF1VKLwFh3nNUIDhR4PmTo5WNEfTXQGohDiBCUKg==
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr229426595e9.12.1795448810466;
        Mon, 23 Nov 2026 07:46:50 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm312466955e9.1.2026.11.23.07.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:46:50 -0800 (PST)
Message-ID: <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
Date: Mon, 23 Nov 2026 16:46:49 +0100
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
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
 <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
 <20261123103633.GB2959742@killaraus.ideasonboard.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <20261123103633.GB2959742@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Laurent,

On 11/23/26 11:36 AM, Laurent Pinchart wrote:
>> I know several SDK versions exist, and supporting several of them is work for a vendor tree.
>> As Geert's cover says, "While upstream Linux must only support sufficiently mature firmware versions, vendor trees (e.g. renesas-lts) may still want to support development firmware versions".
>> Each SDK version can then have its own DT there.
> 
> That's not how DT works. Please be gentle with Krzysztof and avoid
> increasing his blood pressure :-)

These DTs would stay in the vendor tree, so they would not reach Krzysztof :-)
Upstream would have one SCMI DT, as v5 has one table.

>> If a release that changes ids is already out, it needs a new DT, or a quirk for that one release when the DT cannot be updated.
> 
> So you're proposing that, with any new firmware that introduces an ABI
> breakage, every single DTB on all boards in the wild get updated ? That
> just doesn't scale, sorry. Let's forget about that bad idea, and focus
> on finding a good solution.
I think the v5 tables have the same problem.
As Wolfram said, "the driver is then tied to a specific firmware version", so the same ABI breakage needs a new kernel on every board in the wild.
Either way every board needs an update, so I think the fix belong in the firmware.

I also see technical weaknesses in the remapping:
It adds a second layer of ids on top of the SCMI ids, so each new device needs entries in the kernel tables as well as its DT node.
And Zephyr already uses the SCMI ids in its DT for this chip, without such a layer.

With the SDK DTs only in the vendor tree, what technical weakness do you see in the solution I proposed?
I still think it is a good one ^^

Best regards,
Clément
