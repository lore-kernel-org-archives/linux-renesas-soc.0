Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49213 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751039AbdB0GHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2017 01:07:17 -0500
Date: Mon, 27 Feb 2017 16:56:51 +1100
From: "Tobin C. Harding" <me@tobin.cc>
To: Matthew Giassa <matthew@giassa.net>
Cc: wsa@the-dreams.de, linux-renesas-soc@vger.kernel.org,
        gregkh@linuxfoundation.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 1/4] Encasing macros with complex values (ie: base
 value plus index) with parentheses.
Message-ID: <20170227055651.GA7536@eros>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <1488160822-18751-1-git-send-email-matthew@giassa.net>
 <1488160822-18751-2-git-send-email-matthew@giassa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488160822-18751-2-git-send-email-matthew@giassa.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Feb 26, 2017 at 06:00:19PM -0800, Matthew Giassa wrote:
> ---
>  drivers/staging/ks7010/ks_wlan_ioctl.h | 64 +++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
> index 8e62b10..47c8015 100644
> --- a/drivers/staging/ks7010/ks_wlan_ioctl.h
> +++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
> @@ -15,43 +15,43 @@
>  #include <linux/wireless.h>
>  /* The low order bit identify a SET (0) or a GET (1) ioctl.  */


Patches without a git log won't be able to be merged. Please see
Documentation/process/submitting-patches.rst

thanks,
Tobin.

>  
> -/*					SIOCIWFIRSTPRIV + 0 */
> -/* former KS_WLAN_GET_DRIVER_VERSION	SIOCIWFIRSTPRIV + 1 */
> -/*					SIOCIWFIRSTPRIV + 2 */
> -#define KS_WLAN_GET_FIRM_VERSION	SIOCIWFIRSTPRIV + 3
> +/*					(SIOCIWFIRSTPRIV + 0) */
> +/* former KS_WLAN_GET_DRIVER_VERSION	(SIOCIWFIRSTPRIV + 1) */
> +/*					(SIOCIWFIRSTPRIV + 2) */
> +#define KS_WLAN_GET_FIRM_VERSION	(SIOCIWFIRSTPRIV + 3)
>  #ifdef WPS
> -#define KS_WLAN_SET_WPS_ENABLE 		SIOCIWFIRSTPRIV + 4
> -#define KS_WLAN_GET_WPS_ENABLE 		SIOCIWFIRSTPRIV + 5
> -#define KS_WLAN_SET_WPS_PROBE_REQ	SIOCIWFIRSTPRIV + 6
> +#define KS_WLAN_SET_WPS_ENABLE 		(SIOCIWFIRSTPRIV + 4)
> +#define KS_WLAN_GET_WPS_ENABLE 		(SIOCIWFIRSTPRIV + 5)
> +#define KS_WLAN_SET_WPS_PROBE_REQ	(SIOCIWFIRSTPRIV + 6)
>  #endif
> -#define KS_WLAN_GET_EEPROM_CKSUM	SIOCIWFIRSTPRIV + 7
> -#define KS_WLAN_SET_PREAMBLE		SIOCIWFIRSTPRIV + 8
> -#define KS_WLAN_GET_PREAMBLE		SIOCIWFIRSTPRIV + 9
> -#define KS_WLAN_SET_POWER_SAVE		SIOCIWFIRSTPRIV + 10
> -#define KS_WLAN_GET_POWER_SAVE		SIOCIWFIRSTPRIV + 11
> -#define KS_WLAN_SET_SCAN_TYPE		SIOCIWFIRSTPRIV + 12
> -#define KS_WLAN_GET_SCAN_TYPE		SIOCIWFIRSTPRIV + 13
> -#define KS_WLAN_SET_RX_GAIN		SIOCIWFIRSTPRIV + 14
> -#define KS_WLAN_GET_RX_GAIN		SIOCIWFIRSTPRIV + 15
> -#define KS_WLAN_HOSTT			SIOCIWFIRSTPRIV + 16	/* unused */
> -//#define KS_WLAN_SET_REGION            SIOCIWFIRSTPRIV + 17
> -#define KS_WLAN_SET_BEACON_LOST		SIOCIWFIRSTPRIV + 18
> -#define KS_WLAN_GET_BEACON_LOST		SIOCIWFIRSTPRIV + 19
> +#define KS_WLAN_GET_EEPROM_CKSUM	(SIOCIWFIRSTPRIV + 7)
> +#define KS_WLAN_SET_PREAMBLE		(SIOCIWFIRSTPRIV + 8)
> +#define KS_WLAN_GET_PREAMBLE		(SIOCIWFIRSTPRIV + 9)
> +#define KS_WLAN_SET_POWER_SAVE		(SIOCIWFIRSTPRIV + 10)
> +#define KS_WLAN_GET_POWER_SAVE		(SIOCIWFIRSTPRIV + 11)
> +#define KS_WLAN_SET_SCAN_TYPE		(SIOCIWFIRSTPRIV + 12)
> +#define KS_WLAN_GET_SCAN_TYPE		(SIOCIWFIRSTPRIV + 13)
> +#define KS_WLAN_SET_RX_GAIN		(SIOCIWFIRSTPRIV + 14)
> +#define KS_WLAN_GET_RX_GAIN		(SIOCIWFIRSTPRIV + 15)
> +#define KS_WLAN_HOSTT			(SIOCIWFIRSTPRIV + 16) /* unused */
> +//#define KS_WLAN_SET_REGION            (SIOCIWFIRSTPRIV + 17)
> +#define KS_WLAN_SET_BEACON_LOST		(SIOCIWFIRSTPRIV + 18)
> +#define KS_WLAN_GET_BEACON_LOST		(SIOCIWFIRSTPRIV + 19)
>  
> -#define KS_WLAN_SET_TX_GAIN		SIOCIWFIRSTPRIV + 20
> -#define KS_WLAN_GET_TX_GAIN		SIOCIWFIRSTPRIV + 21
> +#define KS_WLAN_SET_TX_GAIN		(SIOCIWFIRSTPRIV + 20)
> +#define KS_WLAN_GET_TX_GAIN		(SIOCIWFIRSTPRIV + 21)
>  
>  /* for KS7010 */
> -#define KS_WLAN_SET_PHY_TYPE		SIOCIWFIRSTPRIV + 22
> -#define KS_WLAN_GET_PHY_TYPE		SIOCIWFIRSTPRIV + 23
> -#define KS_WLAN_SET_CTS_MODE		SIOCIWFIRSTPRIV + 24
> -#define KS_WLAN_GET_CTS_MODE		SIOCIWFIRSTPRIV + 25
> -/*					SIOCIWFIRSTPRIV + 26 */
> -/*					SIOCIWFIRSTPRIV + 27 */
> -#define KS_WLAN_SET_SLEEP_MODE		SIOCIWFIRSTPRIV + 28	/* sleep mode */
> -#define KS_WLAN_GET_SLEEP_MODE		SIOCIWFIRSTPRIV + 29	/* sleep mode */
> -/*					SIOCIWFIRSTPRIV + 30 */
> -/*					SIOCIWFIRSTPRIV + 31 */
> +#define KS_WLAN_SET_PHY_TYPE		(SIOCIWFIRSTPRIV + 22)
> +#define KS_WLAN_GET_PHY_TYPE		(SIOCIWFIRSTPRIV + 23)
> +#define KS_WLAN_SET_CTS_MODE		(SIOCIWFIRSTPRIV + 24)
> +#define KS_WLAN_GET_CTS_MODE		(SIOCIWFIRSTPRIV + 25)
> +/*					(SIOCIWFIRSTPRIV + 26) */
> +/*					(SIOCIWFIRSTPRIV + 27) */
> +#define KS_WLAN_SET_SLEEP_MODE		(SIOCIWFIRSTPRIV + 28) /* sleep mode */
> +#define KS_WLAN_GET_SLEEP_MODE		(SIOCIWFIRSTPRIV + 29) /* sleep mode */
> +/*					(SIOCIWFIRSTPRIV + 30) */
> +/*					(SIOCIWFIRSTPRIV + 31) */
>  
>  #ifdef __KERNEL__
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
