Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D03C4321E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  2 Dec 2022 23:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiLBX4Y (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 2 Dec 2022 18:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233308AbiLBX4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 18:56:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051DDE44
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 15:56:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C5F411B4;
        Sat,  3 Dec 2022 00:56:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670025381;
        bh=720idKHwNa/wGGfU/amV9EcPhl+dS5E3bXfYqnHo4w8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=umAxHWvkE6u6Azq++uWXN+/wmxRS246f5Am5ER0O2m7r7jolJ/ZgyoqNLeAhoH8yA
         XZTDvQbFvPYUN4WDIEKELxDOHOiJW0CwFp9cD60jIDALk9EyUb+yGoFs9h8UhGA6PL
         pIWn8CBB2p+b9glT8qqhx+YRE7sfutWI23HAtT8U=
Date:   Sat, 3 Dec 2022 01:56:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH kms++ 3/4] kms++util: Add endian.h
Message-ID: <Y4qQo4zT4qw9/myt@pendragon.ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221202131658.434114-4-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202131658.434114-4-tomi.valkeinen+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Dec 02, 2022 at 03:16:57PM +0200, Tomi Valkeinen wrote:
> Add simple endianness supporting write function, and, for now, only one
> shortcut helper, write16le().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  kms++util/inc/kms++util/endian.h | 46 ++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 kms++util/inc/kms++util/endian.h
> 
> diff --git a/kms++util/inc/kms++util/endian.h b/kms++util/inc/kms++util/endian.h
> new file mode 100644
> index 0000000..ea09065
> --- /dev/null
> +++ b/kms++util/inc/kms++util/endian.h
> @@ -0,0 +1,46 @@
> +#pragma once
> +
> +#include <type_traits>
> +#include <byteswap.h>
> +#include <stdint.h>
> +
> +static_assert((__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__) ||
> +	      (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__),
> +	      "Unable to detect endianness");
> +
> +enum class endian {
> +	little = __ORDER_LITTLE_ENDIAN__,
> +	big = __ORDER_BIG_ENDIAN__,
> +	native = __BYTE_ORDER__
> +};
> +
> +template<typename T>
> +constexpr T byteswap(T value) noexcept
> +{
> +	static_assert(std::is_integral<T>(), "Type is not integral");
> +	static_assert(sizeof(T) == 2 ||
> +		      sizeof(T) == 4 ||
> +		      sizeof(T) == 8,
> +		      "Illegal value size");
> +
> +	switch (sizeof(T)) {
> +		case 2: return bswap_16(value);
> +		case 4: return bswap_32(value);
> +		case 8: return bswap_64(value);
> +	}
> +}
> +
> +template<endian E, typename T>
> +static void write_endian(T val, T* dst)

I would have swapped the parameters, common APIs have the destination
first and the source second. Same below, and up to you.

> +{
> +	if constexpr (E != endian::native)
> +		val = byteswap(val);
> +
> +	*dst = val;
> +}
> +
> +[[maybe_unused]]
> +static void write16le(uint16_t val, uint16_t* dst)

I wonder if writing

using write16le = write_endian<endian::little, uint16_t>;

would compile.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +{
> +	write_endian<endian::little, uint16_t>(val, dst);
> +}

-- 
Regards,

Laurent Pinchart
