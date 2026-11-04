Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816303;
	b=JrWEt4o6jYpxDkhvtq5KMYG2jqrdwOm4vDQ/y7PhIx6Ed8d/Ll0PHUoGJxoHcHR0xmUs
	 1bh3O1R1GIcw5NwilMWjtDOXwpY7GYLhNDh0YqGX3C6Hhf6sqG2PBd9ihpaU5Qij4lmDF
	 n6VVyyMwu0IL/diMWrzsRhfTcBOplUUficjokWPpxAhulXlOH4tCI5KYL4tYpRkOd7uu2
	 08UIJ3cDthi46Ljxf5uYL5Fs6UPrpw2bM/OjLU1ntRQfZ8FGXRBvqGHVlgQjKyx3OYgIN
	 NSZ2acZHr4dSt9m3+JhlGWVw2mjQGWlsLjmsx2kl8+5NYWyBbts5afsQkLRnT+tRcKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816303;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=sMF+DuUShxHT93jwpB/tWUFXCy+FZ5GF579riWa0i/s=;
	b=3zODEHWiWCpQN42JwtkJpszM3eWgU4lpKJXV/bvzDSN6xx3tN+SA6ikKneinb8bwS2/L
	 m3WYQrPcol7hoOal7DrgRnncfw7C5NMaEcz31aurUQecHdjLbHLWpYnEgiKpfv6qbmKhv
	 1YPqrO5AjNjy2iY75CR5Uka4MQymyYn+errBomqx36S8Yigxh0B2sVqCf2pUD9JpY59R4
	 fPn++R07cI1KV+VcJEOCrjW0YSCvuIUxsfpcQCVOdLjM8IthiSV91xVzWI+ZG+m30uxaG
	 u6vfTVjMTJehOMW9Xncaz9HyzGV1d7RvjXqEkraR9Ao5gjr9nph6rUUOHoYtXHfe8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RGtOPZQX;
	arc=none smtp.remote-ip=74.125.224.100
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D9B606A31B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D9B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RGtOPZQX
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-677bc4704cbso1311809d50.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816302; x=1794421102;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sMF+DuUShxHT93jwpB/tWUFXCy+FZ5GF579riWa0i/s=;
        b=BRg4z/b/fnNSzbfFWS3E/ZapR/07VJqMSRuECpEgc2gMUNQHRIILXv+fHKLduY+nXi
         qA1xLku1vsYhoHnFWoJaBby0WD6EZ08JJ4qiyqtqifjjAb4FTS1iUsWpO4bpDEpXuwOd
         /rap59dRqoh2OE3odxBc+X9T9yOBswyDu+Je/evKuXUpAbK67RBpkjFhlTnSkJD+Gez/
         wJ/d4TYmDRzuM1RC541W5M+E1dYST0qlvOlqG9LgtcEvKyG4WLEAMGQr92+gS07cux84
         T/Z2Ft26DpJPf+K1fiTkTTLOKYPts2Y1EW0WQk/IUNjl/laX0egzZq961C9DPiH69fcZ
         IigQ==
X-Forwarded-Encrypted: i=1; AKwUvBysftPt5lfwWsex3sEJm28/DZ4I9023PiSOJgkRa0dntDv1AfB3jC3aXAL2cQbu+0Kk7/FcW37fR8pU7hMfb/K3Zw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4OTh8c83CgtAFXasN4Q8JK995H7rpxcUncTljr4pvzFbk8Ebb
	Kqi0RW3l1I8uvd91PIzaLyGOIkByP1uvJA1Wps10XVyxr4PTX3s9ASaiHPy3WDlaqje8szKGIEj
	AifrklPa0nIdcstkOOBbt9OWqZpeBEqGbG0JkCt2ZV3DFVmSjIdl6Ho3dhaq8jIvZvku5KoPt0s
	GLpbb5NN3yNDiNJin1gKacEadnlEwTpDJ4COzDG8AhqrSKiWDskEnQ9GnYrPTpRx/dt8L2+8Xo8
	N2lsMuAuLSmCyLCjCB2tapnye/aVVaV0A==
X-Gm-Gg: AYBFou1QUCgs4DG1RjFjmm511isj3cezEBhyoTzb+QdISgFTeoVe5YdXLBMw5jESTbs
	iLqeAk+K9Rfvlyyx39zugBXnfpwcCGGR3czmba/pRLxjEhF0HJAs1GVezbuZUSqqm368qsg++wZ
	4q2okorF0ybhanSABnqZgzT+mu2pbMSOuDA+5sdAuNnvdVqAcaQCxv+LCziUJ74NGplJ8rj3AUf
	0Vrp2y8X2Q2n6h3/Vk34Vahm+sf5JhqPLl+lLrO6/KsaDRuLxyPXp9+3nhSjA7QEo1/1kPPBBv+
	n5pIi0ul1kit1sGgAvXorlPUqz6AHi1IqAetL1FOFOk9BsTj1Q5VT3cIDsu9KNdjYXgsV62VjW8
	KRcB0FOLmjfbtwr8jHrTNAvrd/O7pSnurLAYU5+iiMdRxu07AschVC/JbJAbpofhVI6ueC+1CAU
	72UNbWVtBo384GvD40DH+ts8dEqHjfux978uQ3hAmM
X-Received: by 2002:a05:690e:128e:b0:676:8c05:8426 with SMTP id 956f58d0204a3-67ba509c7bfmr10308007d50.130.1793816301834;
        Wed, 04 Nov 2026 10:18:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67bee1fd69asm39047d50.34.2026.11.04.10.18.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:18:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7bb3e2acso26562336d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816301; x=1794421101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMF+DuUShxHT93jwpB/tWUFXCy+FZ5GF579riWa0i/s=;
        b=RGtOPZQX2Fz9ek0gpNC2zgdSYq0yoKjSv8q/M235QDrvAkXxkbXEdhlbwDUlUp5lun
         FSoUAU25te5vS5o4D349NuR7vfytBFx+k5DOluRTFkT54TjpfElzU2eKd5fMbCHOTvUC
         le9+1vSf+Sr/FhjCDRjA5yTQEiXnEugu5V4BY=
X-Forwarded-Encrypted: i=1; AKwUvByxhN0TZBeRVsa+qiSzGpkzhvB0ay9ECH5Pr6g6csD8q+ItIoH2DWa51dP01q1piNqycfp/yE2/LqPAIpSK0bA1qw==@vger.kernel.org
X-Received: by 2002:a05:6214:5781:b0:91e:8baa:f132 with SMTP id 6a1803df08f44-91e8bab0503mr27359896d6.14.1793816300867;
        Wed, 04 Nov 2026 10:18:20 -0800 (PST)
X-Received: by 2002:a05:6214:5781:b0:91e:8baa:f132 with SMTP id 6a1803df08f44-91e8bab0503mr27359016d6.14.1793816300171;
        Wed, 04 Nov 2026 10:18:20 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e8dac2a3esm9677426d6.1.2026.11.04.10.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:18:19 -0800 (PST)
Message-ID: <c5ecea1e-ae30-4df3-8684-39cfb8288127@broadcom.com>
Date: Wed, 4 Nov 2026 10:18:12 -0800
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
Subject: Re: [PATCH 1/1] mmc: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Aubin Constans <aubin.constans@microchip.com>,
 Ulf Hansson <ulfh@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin
 <shawn.lin@rock-chips.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, John Garry <john.garry@linux.dev>,
 Hemanth Selam <hemanth.selam@gmail.com>, Pengpeng Hou
 <pengpeng@iscas.ac.cn>, Rosen Penev <rosenp@gmail.com>,
 Fan Wu <fanwu01@zju.edu.cn>, Marco Crivellari <marco.crivellari@suse.com>,
 Pan Chuang <panchuang@vivo.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Rakuram Eswaran <rakuram.e96@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
 "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..."
 <linux-mmc@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..."
 <imx@lists.linux.dev>,
 "open list:OMAP MMC SUPPORT" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>,
 "open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>
Cc: vkoul@kernel.org
References: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/2/2026 9:21 AM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across MMC host drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/mmc/host/atmel-mci.c             | 3 +--
>   drivers/mmc/host/bcm2835.c               | 3 +--

For the above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

