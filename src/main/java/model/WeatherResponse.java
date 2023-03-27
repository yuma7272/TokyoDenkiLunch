package model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class WeatherResponse {
	public List<WeatherHourly> hourly;
}
