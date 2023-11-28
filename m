Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gPaU1O+x"
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b5])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642AF95
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 04:01:22 -0800 (PST)
Message-ID: <c7713283-032c-4454-823b-d7de9bfd5d5b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701172880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDnnbdi8L2gDJsglrgs0R0nH2zrPUWNxiPxevkVDh3w=;
	b=gPaU1O+xxAqc3tBWssrXz657e1dVhPemuQUIiIU/4C7YhkPjebi6uS4x8FziXCI6L01XrK
	Euww1v3tuxxNRsRMoau3I3VD2amcXUjYxi/Tj5eDQmtYY9nKbfS3iyygBR04uLhVj6iXWB
	bd+E8AohGEZKlyUaFiseRtX50vO07rI=
Date: Tue, 28 Nov 2023 20:01:13 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [6/8] drm/ofdrm: Do not include <drm/drm_plane_helper.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org
References: <20231128104723.20622-7-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231128104723.20622-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2023/11/28 18:45, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


> ---
>   drivers/gpu/drm/tiny/ofdrm.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 05a72473cfc65..ab89b7fc7bf61 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -19,7 +19,6 @@
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_modeset_helper_vtables.h>
> -#include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_simple_kms_helper.h>
>   
