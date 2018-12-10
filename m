Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] nvmem: check invalid number of bytes in
 nvmem_{read,write}()
To: Biju Das <biju.das@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-rtc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <1544455701-5720-1-git-send-email-biju.das@bp.renesas.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <eb72f5b7-2920-b3b5-8387-d2b6b2d310cd@linaro.org>
Date: Mon, 10 Dec 2018 18:34:09 +0000
MIME-Version: 1.0
In-Reply-To: <1544455701-5720-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>



On 10/12/18 15:28, Biju Das wrote:
> +	/* Stop the user from writing */
> +	if (offset >= nvmem->size)
> +		return -ENOSPC;
> +
This should be "return -EFBIG" to make utilities like dd or sh happy.

Look at 38b0774c0598c ("nvmem: core: return EFBIG on out-of-range 
write") for more info.

other than that, patch looks fine to me!

--srini
