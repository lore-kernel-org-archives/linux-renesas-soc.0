Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC633093B2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468669; cv=none; b=QFOilpVqkBo9RGejUwXWvuZh+1iuwENNEIL+h7Y92pPCtDjqXMRlgcE5zg77liJ1BKycwGnj3+ydQri5zRLfNH+WWji4PIYyU/tSt6lctm8pXpSO7rC5ogTJPMfvrSNLyfXcrQd/716HoFJl+ipojoaxt/Upo9IL76msWeWZMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468669; c=relaxed/simple;
	bh=KUpWza/RBTivHIVw5LUpXLgkwpdnHe3OOe19SRvS6UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jl0F/yPfQB1NPcNX9uxkcwe13hxbcCU8zev21uJ/W30aAVpjUQSPuyWp+HRWG3HOqhCnCPGqikrgD4vuL8/9fIzbxs6mp80b54bPtYYYT0g4g3GwnRAq+PawZi58j+x6Ndepn0HvW4qHTo5OgGbXd8HsQI9aml4Qyw5hQmYzA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NKTC15BE; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NKTC15BE"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65f94011dfaso8125723a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 08:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772468666; x=1773073466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfssTx/ZoY0j/RX1wDHgwFfkiRU0VpOe21pXTWl5HWI=;
        b=NKTC15BEIE8R3SGXehqnGvOjZfdwwyZg/2C8QL19QtkSnF96tqwXqD9TwSFV9eTjCN
         QxC293PUiugrGOSbGiG26yPfraFdND7XJi9s1P6rcXLRhbl6Zflyospw2NvcLPBFpNxB
         BUvKnB5CV534IYhehKLGzLfE5WvSr3AhpphuI+ROQwg61yQz+piVe7uofTwzCjX74T9W
         LG8S56NSeX5Su4n5HcXSp6MhacNMUiAgzErF0QJagNg/gtZTOUsKHDm5H6RbYg19wWXD
         JCGrYNNMcfyjRr+jSSon69VLyFTSIsPMXqnIXW1fmNO+Y6zqZJeGfcY9cPLYnVdqiKCQ
         IBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468666; x=1773073466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfssTx/ZoY0j/RX1wDHgwFfkiRU0VpOe21pXTWl5HWI=;
        b=ku5uvZdKBwViYH06nu+L22wiBv+qjZKX5VD5JFPO/siLQOf5ZJo92Y3+ezQWmlAxvq
         VaqBv4/JLqJnpBDsBnqIlaBiUHfxqNzPsNtoUa/yzf0EeGsixb4sPhhsvy1ZDp6SHnS9
         M6Ny44RKNQnBHhSQRPM/Q1PZCqs6e8fZHQ6lpToFari7hVp+71yhVGWldH0JgiSIDEZw
         L+aUyNItqh+mxLkK9u7Ae3DpkJYhJDnBYtkytT+XEPR5SYtDK56NimgfY9geJUYz70gH
         07rB9Eqit0Ef9OKV0Y6GH1PUwQKqtwDnoylyT3IL1jf+1UTYumaUnvYoYNtS6gJPwNxT
         c22A==
X-Forwarded-Encrypted: i=1; AJvYcCXTEs2HV9lp9uK7jeWq9J/wFLY8GydSzf0DXIUE5iuPcNCmolqq402+6j21ba+WcTl/Emos1aorCkFKUmNpdjSRGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznmasqeE+UXHzAiLaA2FNFYEcj8LoRoIb5BAx3v8tMbzeBgJpe
	fzPV8cVfVP3KOxRnZBXHqDBF3O9RUuSzWJ/0CNcPAXbkWaQ6YnghefFGiZmZKy1z/4g=
X-Gm-Gg: ATEYQzyhSrTsrBl+QoPyJYlHF+nCTMYFXwa8/OAqBc6MlTivgGaXm1bU64eTOFvn3Ql
	VLgozsY5kQQFYE6AQq1dGH53kSrHJzHeWswAyeSIr6NREAX6JF6hw+EQylXtMSBQiuyByT2u4LP
	2r+/0qC05SBGMu2tvslFa6KhKhR+foUfqNbwCjNNLqx4t9LB+xuagKcKK3kRJfwT6IFRVQKIWR1
	m8TN+EGKEcZFcA0DUUCTiAejvURJDju4xiapVnTiLKHHG0p6pe376Y0Vy9Lo/YLecke+uzJmQmU
	TMZlT4sZNskBFQLDcEhH6MuWQY+ciXtGBS7A+NEYsvLrsaqbButDZrK3V5DWbs+8jOdtAkHDvrh
	MFy9xi8KiSBu/L41nkA6Pz1LsUBNTY3RLdbQMIGg8f5TypMhpa0T8vu+kK/MtkNtR6aZe9Stuaj
	HlbDkt+2Z3OB3cyfNwFUsTOf69nGUhjkNe7K3I
X-Received: by 2002:a17:907:847:b0:b88:4efd:6cbf with SMTP id a640c23a62f3a-b9376365c63mr912505766b.12.1772468666419;
        Mon, 02 Mar 2026 08:24:26 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac66feesm489214566b.21.2026.03.02.08.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:24:25 -0800 (PST)
Message-ID: <dc69a0c1-15e9-41fb-91a8-01d4b4188b3d@tuxon.dev>
Date: Mon, 2 Mar 2026 18:24:22 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/26 17:32, John Madieu wrote:
> Add support for the PCIe controller found in RZ/G3E SoCs to the existing
> RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is similar to the
> RZ/G3S's, with the following key differences:
> 
>   - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
>   - Uses a different reset control mechanism via AXI registers instead
>     of the Linux reset framework
>   - Requires specific SYSC configuration for link state control and
>     Root Complex mode selection
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

